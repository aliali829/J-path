import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/show_false_user_service.dart';
import 'package:untitled75/view/dashboard/Users/users_model.dart';

class showCustomersBlockController extends GetxController {
  showCustomersBlockService service = Get.find();
  List<Customers> customersList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    customersList = await service.show_customers_block();

    isLoading(false);
    super.onReady();
  }
}
