import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/cartController.dart';

class PaymentScreen extends StatelessWidget {
  //const PaymentScreen({Key? key}) : super(key: key);

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
     
        //Text(cartController.onCart.first.productName),
      ),
    );
  }
}
