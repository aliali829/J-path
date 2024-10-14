import 'package:get/get.dart';
import 'package:untitled75/getx/controller/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController(), permanent: true);
  }
}
