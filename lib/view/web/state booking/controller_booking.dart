import 'package:get/get.dart';
import 'package:untitled75/view/web/state%20booking/service_Bookings.dart';

import 'mode_booking.dart';

class showAllBookingsController extends GetxController {
  showAllBookingsService service = showAllBookingsService();
  List<Booking> bookingsList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    bookingsList = await service.show_all_bookings();

    isLoading(false);
    super.onReady();
  }
}
