import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/screens/Login/components/background.dart';
import 'package:shopapp/screens/Signup/signup_screen.dart';
import 'package:shopapp/components/already_have_an_account_acheck.dart';
import 'package:shopapp/components/rounded_button.dart';
import 'package:shopapp/components/rounded_input_field.dart';
import 'package:shopapp/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/screens/dashboard.dart';
import 'package:shopapp/screens/payment_screen.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/screens/Signup/signup_screen.dart';
import 'package:shopapp/screens/Login/login_screen.dart';

class Body extends StatelessWidget {
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
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
            //   "assets/icons/login.svg",
            //   height: size.height * 0.35,
            // ),
            SizedBox(height: size.height * 0.03),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              controller: emailController,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
              controller: passwordController,
              obscureText: true,
            ),
            // RoundedInputField(
            //   hintText: "Your Email",
            //   onChanged: (value) {
            //     authController = emailController;
            //   },
            // ),
            // RoundedPasswordField(
            //   onChanged: (value) {},
            // ),
            RoundedButton(
                text: "LOGIN",
                press: () {
                  //controller.login(emailController.text, passwordController.text);
                  // authController.login(emailController.text,passwordController.text).then((value) => Get.to(
                  //          () => (DashboardScreen()),
                  authController.login(
                      emailController.text, passwordController.text);

                  if (FirebaseAuth.instance.currentUser != null) {
                    // wrong call in wrong place!
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DashboardScreen()));
                  }
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
