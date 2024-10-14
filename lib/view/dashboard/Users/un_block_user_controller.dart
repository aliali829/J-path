import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/Users/un_block_user_service.dart';

class UnBlockUserController extends GetxController {
  var status = false;
  //var id;
  UnBlockUserServices service = Get.find();

  Future<void> UnBlockUserOnClick() async {
    //  Company company = Company(id: id);
    status = await service.UnBlockUser();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
