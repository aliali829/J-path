import 'package:get/get.dart';

import 'accept_company_service.dart';

class AcceptCompanyController extends GetxController {
  var status = false;
  //var id;
  AcceptCompanyServices service = Get.find();

  Future<void> AcceptCompanyOnClick() async {
    //  Company company = Company(id: id);
    status = await service.AcceptCompany();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
