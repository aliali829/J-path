import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Trips/trip_pending_service.dart';
import 'package:untitled75/view/dashboard/Trips/true_offer_controller.dart';
import 'package:untitled75/view/dashboard/Trips/true_offer_service.dart';

import '../../../getx/controller/create_trip_controller.dart';
import 'accept_offer_controller.dart';
import 'accept_offer_service.dart';
import 'all_offers_controller.dart';
import 'all_offers_service.dart';
import 'block_offer_controller.dart';
import 'block_offer_service.dart';
import 'controller_offer.dart';
import 'false_offer_controller.dart';
import 'false_offers_service..dart';

class TripBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<showOffersPendingService>(showOffersPendingService(),
        permanent: true);
    Get.put<showOffersPendingController>(showOffersPendingController(),
        permanent: true);
    Get.put<AcceptOfferServices>(AcceptOfferServices(), permanent: true);
    Get.put<AcceptOfferController>(AcceptOfferController(), permanent: true);

    Get.put<RefuseOfferServices>(RefuseOfferServices(), permanent: true);
    Get.put<RefuseOfferController>(RefuseOfferController(), permanent: true);

    Get.put<showOffersActiveService>(showOffersActiveService(),
        permanent: true);
    Get.put<showOffersActiveController>(showOffersActiveController(),
        permanent: true);

    Get.put<showOffersRefuseService>(showOffersRefuseService(),
        permanent: true);
    Get.put<showoffersRefuseController>(showoffersRefuseController(),
        permanent: true);
    Get.put<CreateTripController>(CreateTripController(), permanent: true);

    Get.put<showAllOffersService>(showAllOffersService(), permanent: true);
    Get.put<showAllOffersController>(showAllOffersController(),
        permanent: true);
  }
}
