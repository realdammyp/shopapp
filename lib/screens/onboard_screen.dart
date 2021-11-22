import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/screens/dashboard.dart';
import 'package:shopapp/screens/orderScreen.dart';
import 'package:shopapp/screens/payment_screen.dart';
import 'package:shopapp/screens/signIn.dart';

class OnboardScreen extends StatelessWidget {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign In"),
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
                onPressed: () async {
                  authController.signin().then((value) => Get.to(
                        () => (PaymentScreen()),
                      ));
                },
              ),
              Text("OR CONTINUE BELOW AS GUEST"),
              TextFormField(
                controller: authController.newnameController.value,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: authController.newemailController.value,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                controller: authController.newpassController.value,
                decoration: const InputDecoration(labelText: 'Password'),
                //validator: controller.validator,
                obscureText: true,
              ),
              TextButton(
                child: Text('Signup'),
                onPressed: () async {
                  await authController.createUser().then(
                        (value) => Get.to(SignIn()),
                      );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
//4242424242424242