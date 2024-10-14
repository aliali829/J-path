import 'package:get/get.dart';
import 'package:untitled75/view/web/homePage/my_trips/model_my_trips.dart';
import 'package:untitled75/view/web/homePage/my_trips/service_my_trips.dart';

class showAdminOffersController extends GetxController {
  showAdminOffersService service = showAdminOffersService();
  List<AdminTrip> TripsList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    TripsList = await service.show_all_offers();

    isLoading(false);
    super.onReady();
  }
}
