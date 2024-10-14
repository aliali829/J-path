import 'package:get/get.dart';
import 'package:untitled75/view/dashboard/show%20compnies/service_show_companies.dart';

import '../companies/all-companies_service.dart';
import '../companies/all_companies_controller.dart';
import '../companies/block_controller.dart';
import '../companies/block_service.dart';
import '../companies/false_companies_controller.dart';
import '../companies/false_companies_service.dart';
import '../companies/true_companies_comtroller.dart';
import '../companies/true_companies_service.dart';
import 'accept_company_service.dart';
import 'accept_controller.dart';
import 'controller_show_companies.dart';

class ShowCompaniesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<showCompaniesService>(showCompaniesService(), permanent: true);
    Get.put<showCompaniesController>(showCompaniesController(),
        permanent: true);
    Get.put<showCompaniesActiveService>(showCompaniesActiveService(),
        permanent: true);
    Get.put<ShowCompaniesActiveController>(ShowCompaniesActiveController(),
        permanent: true);
    Get.put<showCompaniesBlockService>(showCompaniesBlockService(),
        permanent: true);
    Get.put<showCompaniesBlockController>(showCompaniesBlockController(),
        permanent: true);
    Get.put<showAllCompaniesService>(showAllCompaniesService(),
        permanent: true);
    Get.put<showAllCompaniesController>(showAllCompaniesController(),
        permanent: true);
    Get.put<AcceptCompanyServices>(AcceptCompanyServices(), permanent: true);
    Get.put<AcceptCompanyController>(AcceptCompanyController(),
        permanent: true);
    Get.put<BlockCompanyServices>(BlockCompanyServices(), permanent: true);
    Get.put<BlockCompanyController>(BlockCompanyController(), permanent: true);
  }
}
