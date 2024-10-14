import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/companies/true_companies_service.dart';

import '../show compnies/show_companies_model.dart';

class ShowCompaniesActiveController extends GetxController {
  showCompaniesActiveService service = Get.find();
  List<Company> companiesList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    companiesList = await service.show_companies_active();

    isLoading(false);
    super.onReady();
  }
}
