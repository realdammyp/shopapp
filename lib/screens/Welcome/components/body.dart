import 'package:flutter/material.dart';
import 'package:shopapp/screens/Login/login_screen.dart';
import 'package:shopapp/screens/Signup/signup_screen.dart';
import 'package:shopapp/screens/Welcome/components/background.dart';
import 'package:shopapp/components/rounded_button.dart';
import 'package:shopapp/screens//constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "DOOBIE INC",
              style: GoogleFonts.cormorantGaramond(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              'assets/images/Doobie-logos_black.png',
              fit: BoxFit.cover,
              height: 300,
              width: 300,
            ),
            // SvgPicture.asset(
            //   "assets/icons/x.svg",
            //   height: size.height * 0.45,
            // ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
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
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
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
