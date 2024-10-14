import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Trips/offer_model.dart';
import 'package:untitled75/view/dashboard/Trips/trip_pending_service.dart';

class showOffersPendingController extends GetxController {
  showOffersPendingService service = Get.find();
  List<Offer> offersList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    offersList = await service.show_offers();

    isLoading(false);
    super.onReady();
  }
}
