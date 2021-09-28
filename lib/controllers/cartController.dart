import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/state_manager.dart';

class CartModel {
  String productID;
  String productName;
  int quantity;
  int price;

  CartModel({
    this.price,
    this.productID,
    this.productName,
    this.quantity,
  });
}

class CartController extends GetxController {
  RxList<CartModel> onCart = <CartModel>[].obs;

  void addtoCart(CartModel item) {
    if (onCart.any((element) => element.productID == item.productID)) {
      try {
         item.quantity += 1;
        onCart[onCart.indexOf(item)] = item;
      } catch (er) {
        print(er);
      }
      onCart.forEach((element) {
        print(element.quantity);
      });
    } else {
      onCart.add(item);
      print('added to car');
    }
  }

  //display added items from database
  void displayItems() {}
}
