import 'package:get/get.dart';
import 'package:persistent_login_form/screen/auth/controllers/auth_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
