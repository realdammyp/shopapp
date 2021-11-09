import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/controllers/cartController.dart';
import 'package:shopapp/screens/dashboard.dart';
import 'package:shopapp/screens/payment_screen.dart';
import 'package:shopapp/screens/signIn.dart';
import 'package:shopapp/screens/onboard_screen.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    final AuthController authController = Get.find();

    //generate a list in this screen
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => ListView.builder(
              itemCount: cartController.onCart.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  height: 130,
                  width: 150,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(cartController.onCart[index].productName),
                          Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    cartController.increase(
                                        cartController.onCart[index].productID);
                                  },
                                  child: Icon(Icons.arrow_upward)),
                              Text(cartController.onCart[index].quantity
                                  .toString()),
                              TextButton(
                                  onPressed: () {
                                    cartController.decrease(
                                        cartController.onCart[index].productID);
                                  },
                                  child: Icon(Icons.arrow_downward)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              authController.auth.value.authStateChanges().listen((event) {
                if (event == null) {
                  //go to checkout as guest or sign in page.
                  Get.to(() => OnboardScreen());
                } else {
                  Get.to(PaymentScreen());
                }
              });
            },
            child: Text('Checkout'),
          ),
          TextButton(
            onPressed: () {
              authController.signOut();
            },
            child: Text('logout'),
          ),
        ],
      ),
    );
  }
}
