import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/show_false_user_service.dart';
import 'package:untitled75/view/dashboard/Users/show_user_service.dart';
import 'package:untitled75/view/dashboard/Users/show_users_controller.dart';
import 'package:untitled75/view/dashboard/Users/un_block_user_controller.dart';
import 'package:untitled75/view/dashboard/Users/un_block_user_service.dart';

import 'all_users_controller.dart';
import 'all_users_service.dart';
import 'block_user_controller.dart';
import 'block_users._service.dart';
import 'false_users_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<showCustomersActiveService>(showCustomersActiveService(),
        permanent: true);
    Get.put<showCustomersActiveController>(showCustomersActiveController(),
        permanent: true);
    Get.put<BlockCustomersServices>(BlockCustomersServices(), permanent: true);

    Get.put<BlockCustomerController>(BlockCustomerController(),
        permanent: true);
    Get.put<showAllCustomersService>(showAllCustomersService(),
        permanent: true);
    Get.put<showAllCustomersController>(showAllCustomersController(),
        permanent: true);
    Get.put<showCustomersBlockService>(showCustomersBlockService(),
        permanent: true);
    Get.put<showCustomersBlockController>(showCustomersBlockController(),
        permanent: true);
    Get.put<UnBlockUserServices>(UnBlockUserServices(), permanent: true);
    Get.put<UnBlockUserController>(UnBlockUserController(), permanent: true);
  }
}
