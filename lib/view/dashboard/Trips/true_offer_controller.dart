import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Trips/offer_model.dart';
import 'package:untitled75/view/dashboard/Trips/true_offer_service.dart';

class showOffersActiveController extends GetxController {
  showOffersActiveService service = Get.find();
  List<Offer> offersList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    offersList = await service.show_offers_active();

    isLoading(false);
    super.onReady();
  }
}
