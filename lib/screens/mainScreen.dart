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
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 30),
              child: Text(
                "Wanipala's Bakery",
                style: TextStyle(fontSize: 40),
              ),
            ),
            //Promo
            const SizedBox(
              height: 5,
            ),
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
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(10),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        onPressed: () {
          func.call();
        },
        child: Text(name),
      ),
    );
  }
}
