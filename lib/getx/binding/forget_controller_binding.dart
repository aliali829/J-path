import 'package:get/get.dart';
import 'package:untitled75/getx/controller/forget_password_controller.dart';

class ForgetBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ForgetController>(ForgetController());
  }
}
