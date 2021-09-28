import 'package:flutter/material.dart';
import 'package:shopapp/controllers/cartController.dart';
import 'package:shopapp/controllers/productController.dart';
import 'package:shopapp/screens/dashboard.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'controllers/dashboardController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp();
  Get.put(ProductController());
  Get.put( CartController());
  Get.put(DashboardController());
  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: DashboardScreen(),
    );
  }
}
