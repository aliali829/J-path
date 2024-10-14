import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/show_user_service.dart';
import 'package:untitled75/view/dashboard/Users/users_model.dart';

class showCustomersActiveController extends GetxController {
  showCustomersActiveService service = Get.find();
  List<Customers> customersList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    customersList = await service.show_customers();

    isLoading(false);
    super.onReady();
  }
}
