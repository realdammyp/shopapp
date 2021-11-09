import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/screens/dashboard.dart';
import 'package:shopapp/screens/payment_screen.dart';

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
                onPressed: () {
                  authController.signin().then(
                        (value) => Get.to(PaymentScreen()),
                      );
                },
              ),
              Text("OR CONTINUE BELOW AS GUEST"),
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
              TextFormField(
                //controller: ,
                decoration:
                    const InputDecoration(labelText: 'Delivery address'),
                //validator: controller.validator,
                obscureText: true,
              ),
              TextButton(
                child: Text('Signup'),
                onPressed: () async {
                  
                  await authController.createUser().then(
                        (value) => Get.to(PaymentScreen()),
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
