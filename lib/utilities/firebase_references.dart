import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// fireStore instance
final fireStore = FirebaseFirestore.instance;

// user collection reference
final userFirestoreReference = fireStore.collection('users');


// Firebase Storage Ref
Reference get firebaseStorageReference => FirebaseStorage.instance.ref();


