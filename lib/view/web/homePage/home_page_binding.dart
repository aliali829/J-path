import 'package:get/get.dart';

import 'home_page_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(HomePageController(), permanent: true);
  }
}
