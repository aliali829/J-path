import 'dart:html';

import 'package:get/get.dart';
import 'package:untitled75/view/web/showCompany/show_company_admin_model.dart';
import 'package:untitled75/view/web/showCompany/show_company_admin_s.dart';

class ShowMyCompanyController extends GetxController {
  ShowMyCompanyService service = Get.find();
  List<ShowCompany> companiesList = [];
  var isLoading = true.obs;
  @override
  void onInit() async {
    companiesList = await service.showMycompany();

    isLoading(false);
    super.onInit();
  }

  @override
  void onReady() async {
    // companiesList = await service.showMycompany();

    //isLoading(false);
    //uper.onReady();
  }

  @override
  void onClose() {
    window.location.reload();
    super.onClose();
  }
}
