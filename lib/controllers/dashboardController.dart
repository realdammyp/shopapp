import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardController extends GetxController {
  int index = 0;
  

  void changeTabIndex(int tabindex) {
    index = tabindex;
   
    update();
  }
}
