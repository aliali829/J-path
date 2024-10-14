import 'package:get/get.dart';

import 'block_offer_service.dart';

class RefuseOfferController extends GetxController {
  var status = false;
  //var id;
  RefuseOfferServices service = Get.find();

  Future<void> RefuseOfferOnClick() async {
    //  Company company = Company(id: id);
    status = await service.RefuseOffer();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
