import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/users_model.dart';

import 'all_users_service.dart';

class showAllCustomersController extends GetxController {
  showAllCustomersService service = Get.find();
  List<Customers> customersList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    customersList = await service.show_all_customers();

    isLoading(false);
    super.onReady();
  }
}
