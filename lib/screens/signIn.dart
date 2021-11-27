// ignore_for_file: unused_import

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopapp/controllers/authController.dart';

// import 'package:shopapp/screens/dashboard.dart';
// import 'package:shopapp/screens/payment_screen.dart';
// // ignore: unused_import
// import 'package:simple_animations/simple_animations.dart';

// class SignIn extends StatelessWidget {
//   final AuthController authController = Get.find();

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Form(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 controller: authController.emailController.value,
//                 decoration: const InputDecoration(labelText: 'E-mail'),
//               ),
//               TextFormField(
//                 controller: authController.passController.value,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 //validator: controller.validator,
//                 obscureText: true,
//               ),
//               TextButton(
//                 child: Text(
//                   'LOGIN',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {
//                   authController
//                       .signin()
//                       .then((value) => Get.off(PaymentScreen()));
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
