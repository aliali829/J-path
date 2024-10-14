import 'package:get/get.dart';
import 'package:untitled75/view/web/state%20booking/service_accept_booking.dart';

class acceptBookingController extends GetxController {
  var status = false;
  //var id;
  acceptBookingServices service = acceptBookingServices();

  Future<void> acceptBookingOnClick() async {
    //  Company company = Company(id: id);
    status = await service.acceptBooking();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
/*

  void clickacceptBooking() async {
    EasyLoading.show(status: "Loading----");
    await controller.acceptBookingOnClick();
    if (controller.status) {
      EasyLoading.showSuccess("sucses");
      //Get.offNamed("/SignIn");
      window.location.reload();
      //controller.token = UserInformation.User_Token;
      /*    if (kIsWeb) {
        Get.off(WebScreen());
      } else {
        Get.off(MobileHome());
      }*/
      //Get.off(WebScreen());
    } else {
      EasyLoading.showError(
        // controller.message,
        "error",
        duration: const Duration(seconds: 6),
        dismissOnTap: true,
      );
    }
  }
 */
