import 'package:get/get.dart';

import 'accept_offer_service.dart';

class AcceptOfferController extends GetxController {
  var status = false;
  //var id;
  AcceptOfferServices service = Get.find();

  Future<void> AcceptOfferOnClick() async {
    //  Company company = Company(id: id);
    status = await service.AcceptOffer();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
