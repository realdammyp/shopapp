import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:shopapp/controllers/cartController.dart';
import 'package:shopapp/controllers/productController.dart';

class MainScreenBody extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetX<ProductController>(
        builder: (productController) {
          return ListView.separated(
            separatorBuilder: (_, indesx) => const Divider(
              color: Colors.black,
            ),
            itemCount: productController.products.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/images/FLOWER.jpg'),
                        image: NetworkImage(
                            productController.products[index].imageurl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        productController.products[index].name.toString(),
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        '\$  ${productController.products[index].price.toString()}',
                      ),
                      Text('Add to Cart'),
                      GestureDetector(
                          onTap: () {
                            //try {
                            //
                            cartController.addtoCart(CartModel(
                              price: productController.products[index].price,
                              productID: productController.products[index].id,
                              productName:
                                  productController.products[index].name,
                              quantity: 1,
                            ));
                            //
                          },
                          child: Icon(Icons.shopping_cart_outlined)),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
