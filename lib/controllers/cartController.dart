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
  int price;
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
}

@override
void initState() {}

class CartController extends GetxController {
  final RxList<CartModel> onCart = <CartModel>[].obs;
  Map<String, dynamic> _paymentIntent;
  String amount = '10000';

  void addtoCart(CartModel item) async {
    //i need to find the index of the element on cart
    if (onCart.any((element) => element.productID == item.productID)) {
      var model =
          onCart.firstWhere((elementd) => elementd.productID == item.productID);
      var index =
          onCart.indexWhere((elementd) => elementd.productID == item.productID);

      model.quantity = model.quantity + 1;

      onCart[index] = model;
    } else {
      onCart.add(item);
    }
  }

  void increase(String id) {
    if (onCart.any((element) => element.productID == id)) {
      var model = onCart.firstWhere((elementd) => elementd.productID == id);
      var index = onCart.indexWhere((elementd) => elementd.productID == id);

      model.quantity = model.quantity + 1;
      onCart[index] = model;
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

  void checkOut() {
    // displaySheet();
    makePayment();
  }

  Future<void> makePayment() async {
    // calling func on cloud functions
    // create payment intent
    final url = Uri.parse(
        'https://us-central1-wpbakery-52166.cloudfunctions.net/stripePayment');

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
      paymentIntentClientSecret: _paymentIntent['paymentIntent'],
      style: ThemeMode.dark,
    ));

    displaySheet();
  }

  Future<void> displaySheet() async {
    await Stripe.instance.presentPaymentSheet().then((value) => print('done'));
  }
}
