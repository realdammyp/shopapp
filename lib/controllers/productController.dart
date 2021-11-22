import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shopapp/models/productModel.dart';

import '../services/database.dart';

class ProductController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxString newProductID = ''.obs;
  RxBool isloading = false.obs;
  RxString currentdBPath = ''.obs;

  //ProductController(Type orderScreen);

  // ignore: must_call_super
  void onInit() {
    // get the products from the database.
    products.bindStream(Database().getprod('Flower'));
    products.bindStream(Database().getprod('Concentrates'));
    products.bindStream(Database().getprod('Edibles'));
  }

  Future<void> changeCatergory(String path) async {
    currentdBPath.value = path;
    products.bindStream(Database().getprod(path));
  }
}
