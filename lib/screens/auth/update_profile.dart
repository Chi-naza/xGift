import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:myapp/utilities/user_feedback.dart';
import 'package:myapp/utilities/utils.dart';
import 'package:file_picker/file_picker.dart';

class UpdateProfileScreen extends StatefulWidget {

  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  // IMAGE UPLOAD
  PlatformFile? pickedImage;


  // function which prompts the user to select an image file
  Future<void> selectAnImage() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;

    setState(() {
      pickedImage = result.files.first;
    });
  }

  // instance of auth controller
  var authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
          return authController.isLoading.value? const Center( child: CircularProgressIndicator()) : Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: GiftDim.size20, vertical: GiftDim.size100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Change Profile Picture',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: GiftDim.size45,
                    fontWeight: FontWeight.w700,
                    color: Color(0xfff26b02),
                  ),
                ),
                SizedBox(height: GiftDim.size30),
                InkWell(
                  onTap: selectAnImage,  // the function that enables us to pick images from device files
                  child: const Text(
                    'Tap Here to Choose',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(height: GiftDim.size15),
                if(pickedImage != null)
                  Container(
                    width: double.infinity,
                    color: Colors.green.shade100,
                    padding: EdgeInsets.all(GiftDim.size10),
                    child: Text(pickedImage!.name),
                  ),
                SizedBox(height: GiftDim.size20),
                AppButton(
                  text: 'Upload Profile Image', 
                  onPressed: () {
                    if(pickedImage == null){
                      UserFeedBack.showErrorSnackBar("Please select an image in order to proceed. Tap to Choose");
                    }else{
                      // calling the function that implements image upload to database
                      authController.changeProfileImage(pickedImage!);
                    }
                  }
                ),
                 SizedBox(height: GiftDim.size40),
                InkWell(
                  onTap: () => Get.back(),
                  child: Text(
                    'Go Back',
                    style: TextStyle(color: Colors.grey, fontSize: GiftDim.size18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}