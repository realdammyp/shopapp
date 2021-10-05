import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/cartController.dart';
import 'package:shopapp/controllers/productController.dart';
import 'package:shopapp/widgets/main_screen_body.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Wanipala's Bakery",
                style: TextStyle(fontSize: 35),
              ),
            ),
            //Promo

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Catogory(
                  name: "Macarons",
                  func: () async {
                    productController.changeCatergory('macarons');
                  },
                ),
                Catogory(
                  name: "Roll Cakes",
                  func: () {
                    productController.changeCatergory("rollcakes");
                  },
                ),
                Catogory(
                  name: "Cakes",
                  func: () {
                    productController.changeCatergory("cakes");
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MainScreenBody(),
          ],
        ),
      ),
    );
  }
}

class Catogory extends StatelessWidget {
  final String name;
  final Function func;

  const Catogory({
    this.name,
    this.func,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          func.call();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 0.5,
              ),
            ),
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
