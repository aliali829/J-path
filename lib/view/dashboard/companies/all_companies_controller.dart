import 'package:get/get.dart';

import '../show compnies/show_companies_model.dart';
import 'all-companies_service.dart';

class showAllCompaniesController extends GetxController {
  showAllCompaniesService service = Get.find();
  List<Company> companiesList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    companiesList = await service.show_all_companies();

    isLoading(false);
    super.onReady();
  }
}
