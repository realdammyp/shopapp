import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shopapp/models/productModel.dart';

import '../services/database.dart';



class ProductController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxString newProductID =''.obs;
  RxBool isloading = false.obs;
  RxString currentdBPath =''.obs;
 


  

  // ignore: must_call_super
  void onInit() {
    // get the products from the database.
    products.bindStream(Database().getprod('macarons'));
  }

  void changeCatergory(String path) {
    currentdBPath.value = path as String;
    products.bindStream(Database().getprod(path));
    if (products.length < 0) {
      isloading.value = true;
      print(isloading.value);
    } else {
      isloading.value = false;
      print(isloading.value);
    }
  }

  void delete(String id) {
    Database().deleteItem(id, currentdBPath.value);
  }

  //upload image, get downloard url then update Image url field
  // Future uploadImage() async {
  //   PickMethod()

  //   if (image == null) {
  //     print('empty');
  //   }

  //   filePath = File(image.path);
  //   // final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   // file = pickedImage.path;
  //   //await Database().uploadImage(filePath);
  //   print(filePath);

  //   update();
  //   // Database().uploadImage(imagePath);
  // }
}
