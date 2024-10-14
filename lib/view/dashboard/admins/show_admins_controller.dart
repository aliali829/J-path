import 'package:get/get.dart';

import 'admin_model.dart';
import 'admin_show_service.dart';

class showAdminsController extends GetxController {
  showAdminsService service = Get.find();
  List<Admin> adminsList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    adminsList = await service.show_admins();

    isLoading(false);
    super.onReady();
  }
}
