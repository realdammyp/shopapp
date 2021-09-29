import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/cartController.dart';
import 'package:shopapp/controllers/productController.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartController prtController = Get.find();

    //generate a list in this screen
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: prtController.onCart.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Text(prtController.onCart[index].productID),
                  Text(prtController.onCart[index].quantity.toString()),
                  Text(prtController.onCart[index].productName)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
