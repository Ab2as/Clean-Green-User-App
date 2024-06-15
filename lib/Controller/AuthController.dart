import 'dart:io';

import 'package:clean_and_green_app/Model/RegisterModel.dart' as registerProb;
import 'package:clean_and_green_app/Model/UpdateUserProfile.dart' as update;
import 'package:clean_and_green_app/Model/UserModel.dart' as model;
import 'package:clean_and_green_app/Widgets/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage;

  late Rx<User?> _user;

  File? get ProfilePhoto => _pickedImage.value;

  User get user => _user.value!;

  RxString imagePath = "".obs;

  //upload to firestore storage

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebsaeStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);

    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<String> _uploadStorage(File image) async {
    Reference ref = firebsaeStorage.ref().child('ProblemPics');

    UploadTask uploadTask = ref.putFile(image);

    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<bool> registerUser(
      String username,
      String email,
      String password,
      File? image,
      String state,
      String city,
      String address,
      String pincode,
      String mobileNumber) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          state.isNotEmpty &&
          city.isNotEmpty &&
          address.isNotEmpty &&
          pincode.isNotEmpty &&
          image != null &&
          mobileNumber.isNotEmpty) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        String downloadUrl = await _uploadToStorage(image);

        model.User user = model.User(
          name: username,
          email: email,
          profilePhoto: downloadUrl,
          state: state,
          city: city,
          address: address,
          pincode: pincode,
          uid: cred.user!.uid,
          mobileNumber: mobileNumber,
        );

        await firestore
            .collection('UserProfile')
            .doc(cred.user!.uid)
            .set(user.toJson());
        return true;
      } else {
        Get.snackbar(
          "Error Creating Account",
          'Please enter all the fields',
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error Creating Account",
        e.toString(),
      );
      return false;
    }
  }

  Future<bool> registerProblem(
    String username,
    String email,
    File? image,
    String state,
    String city,
    String address,
    String pincode,
    String mobileNumber,
    String id,
    String problemAddress,
    String date,
    String completed,
    String category,
    String description,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          state.isNotEmpty &&
          city.isNotEmpty &&
          address.isNotEmpty &&
          pincode.isNotEmpty &&
          id.isNotEmpty &&
          problemAddress.isNotEmpty &&
          date.isNotEmpty &&
          completed.isNotEmpty &&
          category.isNotEmpty &&
          description.isNotEmpty &&
          image != null &&
          mobileNumber.isNotEmpty) {
        String downloadUrl = await _uploadStorage(
          image,
        );

        registerProb.Register regis = registerProb.Register(
          id: id,
          problemAddress: problemAddress,
          date: date,
          completed: completed,
          category: category,
          description: description,
          name: username,
          email: email,
          problemPhoto: downloadUrl,
          state: state,
          city: city,
          address: address,
          pincode: pincode,
          mobileNumber: mobileNumber,
        );

        await firestore.collection('RegisterProblem').doc().set(regis.toJson());
        return true;
      } else {
        Get.snackbar(
          "Error Creating Account",
          'Please enter all the fields',
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error Creating Account",
        e.toString(),
      );
      return false;
    }
  }

  Future<bool> UpdateRegisterProblem(
    String documentId,
    String username,
    String email,
    String image,
    String state,
    String city,
    String address,
    String pincode,
    String mobileNumber,
    String id,
    String problemAddress,
    String date,
    String completed,
    String category,
    String description,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          state.isNotEmpty &&
          city.isNotEmpty &&
          address.isNotEmpty &&
          pincode.isNotEmpty &&
          id.isNotEmpty &&
          problemAddress.isNotEmpty &&
          date.isNotEmpty &&
          completed.isNotEmpty &&
          category.isNotEmpty &&
          description.isNotEmpty &&
          image != null &&
          mobileNumber.isNotEmpty) {
        // String downloadUrl = await _uploadStorage(
        //   image,
        // );

        registerProb.Register regis = registerProb.Register(
          id: id,
          problemAddress: problemAddress,
          date: date,
          completed: completed,
          category: category,
          description: description,
          name: username,
          email: email,
          problemPhoto: image,
          state: state,
          city: city,
          address: address,
          pincode: pincode,
          mobileNumber: mobileNumber,
        );

        await firestore
            .collection('RegisterProblem')
            .doc(documentId)
            .set(regis.toJson());
        return true;
      } else {
        Get.snackbar(
          "Error Creating Account",
          'Please enter all the fields',
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error Creating Account",
        e.toString(),
      );
      return false;
    }
  }

  Future<bool> UpdateUserProfile(
      String documentId,
      String username,
      String email,
      File? image,
      String state,
      String city,
      String shopAddress,
      String pincode,
      String uid,
      String mobileNumber) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          state.isNotEmpty &&
          city.isNotEmpty &&
          shopAddress.isNotEmpty &&
          pincode.isNotEmpty &&
          image != null &&
          uid.isNotEmpty &&
          mobileNumber.isNotEmpty) {
        String downloadUrl = await _uploadStorage(image);

        update.UpdateProfile updateP = update.UpdateProfile(
            name: username,
            email: email,
            profilePhoto: downloadUrl,
            state: state,
            city: city,
            shopAddress: shopAddress,
            pincode: pincode,
            uid: uid,
            mobileNumber: mobileNumber);

        await firestore
            .collection('DealerProfile')
            .doc(documentId)
            .set(updateP.toJson());
        print("Profile updated successfully.");
        return true;
      } else {
        Get.snackbar(
          "Error Creating Account",
          'Please enter all the fields',
        );
        print("Error: One or more fields are empty or null.");
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error Creating Account",
        e.toString(),
      );
      print("Exception caught: $e");
      return false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        print("Log Success");
        return true;
      } else {
        Get.snackbar(
          "Error Logging in",
          'Please enter all the fields',
        );
        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error Creating Account",
        e.toString(),
      );
      return false;
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }

  resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar("Email Sent", "Password Reset Email has been sent");
    } catch (e) {
      Get.snackbar("User Not Found", "No user fount for that email");
    }
  }
}
