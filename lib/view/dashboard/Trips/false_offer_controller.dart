import 'package:get/get.dart';

import 'false_offers_service..dart';
import 'offer_model.dart';

class showoffersRefuseController extends GetxController {
  showOffersRefuseService service = Get.find();
  List<Offer> offersList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    offersList = await service.show_offers_refuse();

    isLoading(false);
    super.onReady();
  }
}
