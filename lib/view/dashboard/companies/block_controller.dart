import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/companies/block_service.dart';

class BlockCompanyController extends GetxController {
  var status = false;
  //var id;
  BlockCompanyServices service = Get.find();

  Future<void> BlockCompanyOnClick() async {
    //  Company company = Company(id: id);
    status = await service.BlockCompany();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
