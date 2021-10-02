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

  void addtoCart(CartModel item) async {
    if (onCart.any((element) => element.productID == item.productID)) {
      print(item.quantity);
      var updatedModel = CartModel(
        price: item.price,
        productID: item.productID,
        quantity: item.quantity + 1,
        productName: item.productName,
      );

      print('updated  ${updatedModel.quantity}');

      onCart[onCart.indexOf(item)] = updatedModel;
      update();
    } else {
      onCart.add(item);
      update();
    }
  }

  //display added items from database
  void displayItems() {}
}
