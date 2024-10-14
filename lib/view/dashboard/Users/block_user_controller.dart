import 'package:get/get.dart';

import 'block_users._service.dart';

class BlockCustomerController extends GetxController {
  var status = false;
  //var id;
  BlockCustomersServices service = Get.find();

  Future<void> BlockCustomerOnClick() async {
    //  Company company = Company(id: id);
    status = await service.BlockCustomers();
  }
}
