import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/controllers/userController.dart';
import 'package:shopapp/screens/dashboard.dart';
import 'package:shopapp/screens/Login/login_screen.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return DashboardScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
