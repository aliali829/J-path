import 'package:get/get.dart';

import 'all_offers_service.dart';
import 'offer_model.dart';

class showAllOffersController extends GetxController {
  showAllOffersService service = Get.find();
  List<Offer> offersList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    offersList = await service.show_all_offers();

    isLoading(false);
    super.onReady();
  }
}
