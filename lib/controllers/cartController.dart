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
      item.quantity = item.quantity + 1;
      onCart[onCart.indexOf(item)] = item;
    } else {
      onCart.add(item);
    }
  }
  // for (var v in onCart) {
  //   try {
  //     if (v.productID == item.productID) {
  //       item.quantity = item.quantity + 1;
  //       var index = onCart.indexOf(v);
  //       onCart[index] = item;
  //       //cart[cart.indexOf(product)] = product;
  //       print('added succs');
  //     } else {
  //       onCart.add(item);
  //       print('added');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //display added items from database
  void displayItems() {}
}
