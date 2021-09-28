import 'dart:core';

class Product {
  int id;
  String name;
  int price;
  int quantity;
  Product(this.id, this.name, this.price, this.quantity);
}

List<Product> cart = [];

void addToCart(Product product) {
  if (cart.any((element) => element.id == product.id)){
    product.quantity = product.quantity + 1;
    cart[cart.indexOf(product)] = product;
  }else{
    cart?.add(product);
  }
  notifyUpdate(product);
}

notifyUpdate(Product product) {
  print('Added '+product.name.toString()+' to the Cart');
}

void main() {
  Product apple = Product(1, "Apple", 100, 1);
  Product banana = Product(2, "Banana", 200, 1);
  Product orange = Product(3, "Orange", 300, 1);
  Product mango = Product(4, "Mango", 400, 1);
  Product pineapple = Product(5, "Pineapple", 500, 1);
  Product watermelon = Product(6, "Watermelon", 600, 1);
  Product strawberry = Product(7, "Strawberry", 700, 1);
  Product grapes = Product(8, "Grapes", 800, 1);

  addToCart(apple);
  addToCart(apple);
  addToCart(banana);
  addToCart(banana);
  addToCart(orange);
  addToCart(orange);
  addToCart(orange);
  addToCart(mango);
  addToCart(pineapple);
  addToCart(watermelon);
  addToCart(watermelon);
  addToCart(strawberry);
  addToCart(grapes);
  print('\n');
  cart?.forEach((element) {
    print(element.name.toString() + ' (' + element.quantity.toString() + ')');

  });
}