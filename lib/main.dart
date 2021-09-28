import 'package:flutter/material.dart';
import 'package:shopapp/controllers/productController.dart';
import 'package:shopapp/screens/dashboard.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp();
  Get.put(ProductController());
  

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
