import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/show%20compnies/service_show_companies.dart';
import 'package:untitled75/view/dashboard/show%20compnies/show_companies_model.dart';

class showCompaniesController extends GetxController {
  showCompaniesService service = Get.find();
  List<Company> companiesList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  @override
  void onReady() async {
    companiesList = await service.show_companies();

    isLoading(false);
    super.onReady();
  }
}
