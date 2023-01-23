import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/screens/auth/signin_screen.dart';
import 'package:myapp/screens/deposit/deposit_history_list.dart';
import 'package:myapp/utilities/firebase_references.dart';
import 'package:myapp/utilities/message_logger.dart';
import 'package:myapp/utilities/user_feedback.dart';

class AuthController extends GetxController {

  late FirebaseAuth auth;

  Rxn<User> user = Rxn<User>();

  late Stream<User?> authStateChanges;

  final isLoading = false.obs;

  final usersList = <UserModel>[].obs;
  UserModel get currentUserDetails => usersList.first;



  @override
  void onReady() {
    initializeGiftApp();
    super.onReady();
  }



  // This function is called when the app first starts. It launches the app
  Future<void> initializeGiftApp() async {
    auth = FirebaseAuth.instance;
    authStateChanges = auth.authStateChanges();

    // listen to changes
    authStateChanges.listen((User? currentUser) { 
      user.value = currentUser;
    });

    // fetch user data if user is logged in
    if(isUserLoggedIn()){
      await fetchUserData();
    }

  }


  bool isUserLoggedIn(){
    return auth.currentUser != null;
  }


  void goToTransactionHistoryScreen(){
    Get.offAllNamed(DepositHistoryList.routeName);
  }


  void goToLoginScreen(){
    Get.offAllNamed(SignInScreen.routeName);
  }


  // A function which returns the currently loggedIn user. 
  // And we can then access the user's details
  User? getUser(){
    user.value = auth.currentUser;
    return user.value;
  }




  // A function which registers  a user when called
  Future<void> signUpUser({ required String email, required String password, required String fName, required String surName, required String phoneNumber, required String country, required String ISOcode}) async{
    // creating empty image String when user first signs Up
    String imageUrl = '';
    try{
      // start Loading
      isLoading.value = true;

      await auth.createUserWithEmailAndPassword(email: email, password: password);
      // save user details in the Database
      await saveUserInFireStore(email.toLowerCase(), fName, surName, phoneNumber, country, imageUrl, ISOcode);
      // Get details of user after signup
      await fetchUserData();
      // stop loading
      isLoading.value = false;
      UserFeedBack.showSuccessSnackBar('Registration successful!');
      await Future.delayed(const Duration(seconds: 1));
      // signOut User
      await auth.signOut();
      // Go to login screen
      goToLoginScreen();
    }on FirebaseAuthException catch(e){
      AppLogger.e(e);
      // stop loading
      isLoading.value = false;
      UserFeedBack.showErrorSnackBar('Registration failed !');
    }
  }



  // A function which logs In a user when called
  Future<void> signInUser(String email, String password) async{
    try{
      // start Loading
      isLoading.value = true;

      await auth.signInWithEmailAndPassword(email: email, password: password);
      // delay before next API call
      await Future.delayed(const Duration(seconds: 1));      
      // stop loading
      isLoading.value = false;
      // show success feedback
      UserFeedBack.showSuccessSnackBar('Login successful !');
      await Future.delayed(const Duration(seconds: 1));
      // Get details of user after login
      await fetchUserData();
      // move into the app upon login
      goToTransactionHistoryScreen();
    }on FirebaseAuthException catch(e){
      AppLogger.e(e);
      // stop loading
      isLoading.value = false;
      UserFeedBack.showErrorSnackBar('Login Failed');
    }

  }



  // A function which logs Out a user when called
  Future<void> signOutUser() async{
    try{
      await auth.signOut();
      UserFeedBack.showSuccessSnackBar('Logout Successful !');
      await Future.delayed(const Duration(seconds: 1));
      goToLoginScreen();
    }catch (e){
      AppLogger.e(e);
    }
  }




  // Function which creates a user in the fireStore DB when registration is done
  Future<void> saveUserInFireStore(String email, String fn, String ln, String phone, String selectedCountry, String imageUrl, String isoCode) async {
    UserModel userModel = UserModel(
      firstName: fn, 
      surname: ln, 
      email: email.toLowerCase(), 
      phoneNumber: phone, 
      country: selectedCountry, 
      dateRegistered: DateFormat.yMMMMEEEEd().format(DateTime.now()), // eg Wednesday, January 4, 2023
      imageUrl: imageUrl,
      ISOcode: isoCode,
      balance: 0,
    );

    // serializing it to Json and sending it to user collection in fireStore
    await userFirestoreReference.doc(email).set(userModel.toJson());
    print('Saved in FireStore');

  }


  
  // A function to get all users data from the Database
  Future<void> fetchUserData() async {
    try{
      
      // retrieving user data
      DocumentSnapshot<Map<String, dynamic>> userData = await userFirestoreReference.doc(getUser()!.email).get();
      final currentUser = UserModel.fromSnapshot(userData); 
      usersList.assign(currentUser);         

      // Testing
      print(currentUser.firstName);
      print(currentUser.surname);
      print(currentUser.email);
      print(currentUser.imageUrl);
      

    }catch (e){
      AppLogger.e(e);
    }
  }

  




  



  // A function which will upload profile image when called
  Future<String> uploadProfileImage(PlatformFile pickedImage) async {
    UploadTask? uploadTask;

    final path = "profileImages/${pickedImage.name}";
    final file = File(pickedImage.path!);

    // setting the upload path: path is the directory it will be uploaded to
    final ref = firebaseStorageReference.child(path);
    uploadTask = ref.putFile(file);

    // upload is in progress: whenComplete works like then() in 'Futures' -- you write 
    // what you want happen when the future completes. 
    // Our future here is the uploadTask, which uploads the pickedFile
    final taskSnapshot = await uploadTask.whenComplete(() => debugPrint('Image Upload Complete') );

    // Getting the uploaded file's/image's download url
    final imageUrl = await taskSnapshot.ref.getDownloadURL();
    print("Uploaded Image's download url: $imageUrl");

    return imageUrl;
  }




  // A function which updates user's profile image
  Future<void> changeProfileImage(PlatformFile pickedImage) async {
    try{
      // start loading
      isLoading.value = true;
     // Get the current user's info and data
      DocumentSnapshot<Map<String, dynamic>> userData = await userFirestoreReference.doc(getUser()!.email).get();
      // delay before calling the uploadTask function
      await Future.delayed(const Duration(seconds: 1));
      // uploading the picked image using uploadTask and storing the url in a variable
      String imageUrl = await uploadProfileImage(pickedImage);
      // update the image field which is gotten from fetched user data
      await userData.reference.update({'image_url' : imageUrl});
      // delay before next API call
      await fetchUserData();
      // stop loading
      isLoading.value = false;
      // show success feedback
      UserFeedBack.showSuccessSnackBar('You have successfully changed your profile picture!');
      await Future.delayed(const Duration(seconds: 1));
      goToTransactionHistoryScreen();
    }catch (e){
      AppLogger.e(e);
      // stop loading
      isLoading.value = false;
      UserFeedBack.showErrorSnackBar('Image Upload Failed !');
    }
  }




  // A function which gets the details or data of the current user
  // Future<void> getCurrentUserDetails() async {
  //   try{
  //     // activating loading
  //     isLoading.value = true;
  //     // Getting loggedIn user's data
  //     DocumentSnapshot<Map<String, dynamic>> user = await userFirestoreReference.doc(getCurrentUser()!.email).get();
  //     var currentlyLoggedInUser = UserModel.fromSnapshot(user);
  //     currentUserData = currentlyLoggedInUser;

  //     // initializing our profile image reactive variable
  //     usersProfileImage.value = currentUserData.imageUrl;

  //     await Future.delayed(const Duration(seconds: 1));
  //     // getting user's sales
  //     QuerySnapshot<Map<String, dynamic>> userSaleData = await userFirestoreReference.doc(currentUserData.email).collection('mySales').get();
  //     // serializing it to a salesModel object
  //     final salesDataList = userSaleData.docs.map(((e) => SalesModel.fromSnapshot(e))).toList();
  //     // assigning the serialized object the field of mySales in the userModel
  //     currentUserData.mySales.assignAll(salesDataList);

  //     // deactivating loading
  //     isLoading.value = false;
  //   }catch (e){
  //     AppLogger.e(e);
  //   }
  // }



}