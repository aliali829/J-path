import 'package:get/get.dart';
import 'package:untitled75/view/web/homePage/booking/customers/model_customers.dart';
import 'package:untitled75/view/web/homePage/booking/customers/service_customers.dart';

class showMyCustomeController extends GetxController {
  showMyCustomeService service = showMyCustomeService();
  List<Admincustomers> customersList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    customersList = await service.showMycustome();

    isLoading(false);
    super.onReady();
  }
}
