
import 'package:get/get.dart';
class AuthController extends GetxController  {
  int selectedTabIndex = 0;
  void changeTabIndex(int index) {
    selectedTabIndex = index;
    update();
  }
}
