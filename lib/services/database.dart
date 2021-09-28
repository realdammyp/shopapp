// we handle all communcations to and from to firebase

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopapp/models/productModel.dart';

class Database extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  

  //stream from database
  Stream<List<ProductModel>> getprod(String path) {
    return _firestore.collection(path).snapshots().map((QuerySnapshot query) {
      List<ProductModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ProductModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      });
      return retVal;
    });
  }

  Future<void> deleteItem(String productID, String path) async {
    try {
      await _firestore.collection(path).doc(productID).delete();
    } catch (e) {
      print(e);
    }
  }
}
