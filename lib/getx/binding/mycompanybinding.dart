import 'package:get/get.dart';

import '../../view/web/showCompany/show_company_admin_c.dart';

class ForgetBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ShowMyCompanyController>(ShowMyCompanyController());
  }
}
