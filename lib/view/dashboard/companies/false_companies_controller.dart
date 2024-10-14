import 'package:get/get.dart';

import '../show compnies/show_companies_model.dart';
import 'false_companies_service.dart';

class showCompaniesBlockController extends GetxController {
  showCompaniesBlockService service = Get.find();
  List<Company> companiesList = [];
  var isLoading = true.obs;
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    companiesList = await service.show_companies_block();

    isLoading(false);
    super.onReady();
  }
}
