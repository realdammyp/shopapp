import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/screens/dashboard.dart';


class SignIn extends StatelessWidget {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: authController.emailController.value,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                controller: authController.passController.value,
                decoration: const InputDecoration(labelText: 'Password'),
                //validator: controller.validator,
                obscureText: true,
              ),
              TextButton(
                child: Text('Login'),
                onPressed: () {
                  authController.signin().then((value) => Get.off(DashboardScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
