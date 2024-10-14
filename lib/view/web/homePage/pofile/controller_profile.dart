import 'package:get/get.dart';
import 'package:untitled75/view/web/homePage/pofile/service_profile.dart';

import 'model_profile.dart';

class showMyProfileController extends GetxController {
  showProfileService service = showProfileService();
  List<Profile> ProfileList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    ProfileList = await service.showProfile();

    isLoading(false);
    super.onReady();
  }
}
