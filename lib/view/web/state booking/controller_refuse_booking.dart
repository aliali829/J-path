import 'package:get/get.dart';
import 'package:untitled75/view/web/state%20booking/service_refuse_booking.dart';

class refuseBookingController extends GetxController {
  var status = false;
  //var id;
  refuseBookingServices service = refuseBookingServices();

  Future<void> refuseBookingOnClick() async {
    //  Company company = Company(id: id);
    status = await service.refuseBooking();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
/*

  void clickrefuseBooking() async {
    EasyLoading.show(status: "Loading----");
    await controller.refuseBookingOnClick();
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
