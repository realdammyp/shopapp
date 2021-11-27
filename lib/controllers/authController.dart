import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopapp/controllers/userController.dart';
import 'package:shopapp/models/user.dart';
import 'package:shopapp/services/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  //Rx<User> _firebaseUser = Rx<User>();
  Rxn _firebaseUser = Rxn();
  //final _firebaseUser = User().obs;
  User get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      UserModel _user = UserModel(
        //id: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}








// class AuthController extends GetxController {
//   Rx<FirebaseAuth> auth = FirebaseAuth.instance.obs;
//   Rx<String> user;
//   Rx<TextEditingController> emailController = TextEditingController().obs;
//   Rx<TextEditingController> passController = TextEditingController().obs;
//   Rx<TextEditingController> newnameController = TextEditingController().obs;
//   Rx<TextEditingController> newemailController = TextEditingController().obs;
//   Rx<TextEditingController> newpassController = TextEditingController().obs;

//   Future<void> createUser() async {
//     try {
//       await auth.value.createUserWithEmailAndPassword(
//           email: newemailController.value.text,
//           password: newpassController.value.text);
//       return "Account Created";
//       //user.value = auth.value.currentUser.email;
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> signin() async {
//     try {
//       await auth.value.signInWithEmailAndPassword(
//           email: emailController.value.text,
//           password: passController.value.text);
//       print(auth.value.currentUser);
//     } catch (e) {
//       Get.snackbar(
//         "Incorrect email or password",
//         e.message,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await auth.value.signOut();
//       print('signed out');
//     } catch (e) {
//       print(e);
//     }
//   }
// }
