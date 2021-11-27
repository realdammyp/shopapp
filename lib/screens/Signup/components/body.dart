import 'package:flutter/material.dart';
import 'package:shopapp/screens/Login/login_screen.dart';
import 'package:shopapp/screens/Signup/components/background.dart';
import 'package:shopapp/screens/Signup/components/or_divider.dart';
import 'package:shopapp/screens/Signup/components/social_icon.dart';
import 'package:shopapp/components/already_have_an_account_acheck.dart';
import 'package:shopapp/components/rounded_button.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/components/rounded_input_field.dart';
import 'package:shopapp/components/rounded_password_field.dart';
import 'package:shopapp/screens/Welcome/welcome_screen.dart';

import 'package:shopapp/screens/dashboard.dart';
import 'package:shopapp/screens/payment_screen.dart';
import 'package:shopapp/controllers/authController.dart';

class Body extends GetWidget<AuthController> {
  //final AuthController authController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              'assets/images/Doobie-logos_black.png',
              fit: BoxFit.cover,
              height: 250,
              width: 250,
            ),
            // SvgPicture.asset(
            //   "assets/icons/signup.svg",
            //   height: size.height * 0.35,
            // ),
            TextFormField(
              decoration: InputDecoration(hintText: "Full Name"),
              controller: nameController,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              controller: emailController,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
              controller: passwordController,
            ),
            // RoundedInputField(
            //   hintText: "Full Name",

            //   onChanged: (value) {},
            // ),
            // RoundedInputField(
            //   hintText: "Your Email",
            //   onChanged: (value) {

            //   },
            // ),
            // RoundedPasswordField(
            //   onChanged: (value) {

            //   },
            // ),
            RoundedButton(
              text: "SIGNUP",
              press: ()  {
                controller.createUser(nameController.text,
                      emailController.text, passwordController.text);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
