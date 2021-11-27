import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:shopapp/controllers/cartController.dart';
import 'package:shopapp/screens/Welcome/welcome_screen.dart';
import 'package:shopapp/screens/dashboard.dart';
import 'package:shopapp/screens/payment_screen.dart';
import 'package:shopapp/screens/signIn.dart';

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
                    color: Colors.white12,
                  ),
                  height: 130,
                  width: 150,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartController.onCart[index].productName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            cartController.onCart[index].price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
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
          Obx(
            () => Text(
              'Subtotal \$ ${cartController.totalamount}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
            onPressed: () {
              //go to checkout as guest or sign in page.
              //Get.to(() => PaymentScreen());
              //authController.auth.value.authStateChanges().listen((event) {
              //if (event == null) {
              //go to checkout as guest or sign in page.
              Get.to(() => WelcomeScreen());
              //} else {
              // Get.to(PaymentScreen());
              //}
              //}//);
              //cartController.makePayment();
            },
            child: Text(
              'Proceed to Check-Out',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
