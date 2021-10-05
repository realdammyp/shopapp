import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/state_manager.dart';

class CartModel {
  String productID;
  String productName;
  int quantity;
  int price;
  String url;

  CartModel({
    this.price,
    this.productID,
    this.productName,
    this.quantity,
    this.url,
  });
}

class CartController extends GetxController {
  final RxList<CartModel> onCart = <CartModel>[].obs;

  List<CartModel> tempCart = <CartModel>[];

  void addtoCart(CartModel item) async {
    if (onCart.contains(item.productID)) {
      var insex = onCart.indexOf(item);
    }

    //i need to find the index of the element on cart
    if (onCart.any((element) => element.productID == item.productID)) {
      var model =
          onCart.firstWhere((elementd) => elementd.productID == item.productID);
      var index =
          onCart.indexWhere((elementd) => elementd.productID == item.productID);

      model.quantity = model.quantity + 1;

      onCart[index] = model;

      print('2nd ad  ${model.quantity}');
    } else {
      onCart.add(item);
      print('added 1st time');
    }
  }

  //display added items from database
  void displayItems() {}
}
