import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  Rx<FirebaseAuth> auth = FirebaseAuth.instance.obs;
  Rx<String> user;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;

  Future<void> createUser() async {
    try {
      await auth.value.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passController.value.text);
      user.value = auth.value.currentUser.email;
    } catch (e) {
      print(e);
    }
  }

  Future<void> signin() async {
    try {
      await auth.value.signInWithEmailAndPassword(
          email: emailController.value.text,
          password: passController.value.text);
      print(auth.value.currentUser);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await auth.value.signOut();
      print('signed out');
    } catch (e) {
      print(e);
    }
  }
}
