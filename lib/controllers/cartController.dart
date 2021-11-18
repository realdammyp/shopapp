import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:get/state_manager.dart';

class CartModel {
  String productID;
  String productName;
  int quantity;
  final int price;
  String url;
  String orderPrimaryKey;

  CartModel({
    this.price,
    this.productID,
    this.productName,
    this.quantity,
    this.url,
    this.orderPrimaryKey,
  });

  set p(int p) {
    p = price;
  }
}

@override
void initState() {}

class CartController extends GetxController {
  final RxList<CartModel> onCart = <CartModel>[].obs;
  Map<String, dynamic> _paymentIntent;
  String amount = '10000';
  RxInt totalamount = 0.obs;

  void addtoCart(CartModel item) async {
    //i need to find the index of the element on cart
    if (onCart.any((element) => element.productID == item.productID)) {
      var model =
          onCart.firstWhere((elementd) => elementd.productID == item.productID);
      var index =
          onCart.indexWhere((elementd) => elementd.productID == item.productID);

      model.quantity = model.quantity + 1;

      onCart[index] = model;
      //calculate();
    } else {
      onCart.add(item);
      calculate();
    }
    Get.snackbar(
        "Product Added", "You have added the ${item.productName} to the cart",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  void increase(String id) {
    if (onCart.any((element) => element.productID == id)) {
      var model = onCart.firstWhere((elementd) => elementd.productID == id);
      var index = onCart.indexWhere((elementd) => elementd.productID == id);

      model.quantity = model.quantity + 1;
      model.p = model.price * model.quantity;
      onCart[index] = model;
      calculate();
    }
  }

  void decrease(String id) {
    if (onCart.any((element) => element.productID == id)) {
      var model = onCart.firstWhere((elementd) => elementd.productID == id);
      var index = onCart.indexWhere((elementd) => elementd.productID == id);

      model.quantity = model.quantity - 1;

      onCart[index] = model;
    }
  }

  void removeItem(String productID) {
    if (onCart.any((element) => element.productID == productID)) {
      var model =
          onCart.firstWhere((elementd) => elementd.productID == productID);
      var index =
          onCart.indexWhere((elementd) => elementd.productID == productID);

      model.quantity = model.quantity - 1;

      onCart[index] = model;
    } else {
      onCart.removeWhere((element) => element.productID == productID);
    }
  }

  void calculate() {
    for (int i = 0; i < onCart.length; i++) {
      totalamount.value = onCart[i].price * onCart[i].quantity;
      // onCart.forEach((element) {3ww
      //   totalamount.value = element.price * element.quantity;
      // });

      print(totalamount.value);
    }
  }

  void checkOut() {
    // displaySheet();
    makePayment();
  }

  Future<void> makePayment() async {
    // calling func on cloud functions
    // create payment intent
    final url = Uri.parse(
        'https://us-central1-doobie-e582c.cloudfunctions.net/stripePayment');

    final response = await http.post(
      url,
      body: ({
        'amount': amount,
      }),
    );

    _paymentIntent = json.decode(response.body);

    print(_paymentIntent);

    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: "Dee",
      paymentIntentClientSecret: _paymentIntent['paymentIntent'],
      style: ThemeMode.dark,
    ));

    displaySheet();
  }

  Future<void> displaySheet() async {
    await Stripe.instance.presentPaymentSheet().then((value) => print('done'));
  }
}
