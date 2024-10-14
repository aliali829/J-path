import 'package:get/get.dart';

import 'delete_company_service.dart';

class DeleteCompanyController extends GetxController {
  var status = false;
  //var id;
  DeleteCompanyServices service = Get.find();

  Future<void> DeleteCompanyOnClick() async {
    //  Company company = Company(id: id);
    status = await service.DeleteCompany();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
