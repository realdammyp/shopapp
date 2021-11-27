// we handle all communcations to and from to firebase

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopapp/models/productModel.dart';
//import 'package:shopapp/models/todo.dart';
import 'package:shopapp/models/user.dart';

class Database extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

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
}
