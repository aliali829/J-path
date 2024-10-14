import 'package:get/get.dart';
import 'package:untitled75/view/web/homePage/delete_trip/service_delete_trip.dart';

class DeleteTripController extends GetxController {
  var status = false;
  //var id;
  DeleteTripServices service = DeleteTripServices();

  Future<void> DeleteTripOnClick() async {
    //  Company company = Company(id: id);
    status = await service.DeleteTrip();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
