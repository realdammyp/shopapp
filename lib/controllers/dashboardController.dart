import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class DashboardController extends GetxController {
  RxInt index = 0.obs;

  void changeTabIndex(int tabindex) {
    index.value = tabindex;

    update();
  }
}
