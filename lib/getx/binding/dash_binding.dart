import 'package:get/get.dart';
import 'package:untitled75/getx/controller/dash_controller.dart';
import 'package:untitled75/getx/controller/sign_in_controller.dart';
import 'package:untitled75/view/dashboard/Users/show_false_user_service.dart';
import 'package:untitled75/view/dashboard/Users/show_users_controller.dart';
import 'package:untitled75/view/dashboard/admins/admin_show_service.dart';
import 'package:untitled75/view/dashboard/companies/block_service.dart';
import 'package:untitled75/view/dashboard/companies/false_companies_controller.dart';
import 'package:untitled75/view/dashboard/companies/true_companies_comtroller.dart';
import 'package:untitled75/view/dashboard/show%20compnies/accept_company_service.dart';
import 'package:untitled75/view/dashboard/show%20compnies/controller_show_companies.dart';

import '../../view/dashboard/Trips/accept_offer_controller.dart';
import '../../view/dashboard/Trips/accept_offer_service.dart';
import '../../view/dashboard/Trips/all_offers_controller.dart';
import '../../view/dashboard/Trips/all_offers_service.dart';
import '../../view/dashboard/Trips/block_offer_controller.dart';
import '../../view/dashboard/Trips/block_offer_service.dart';
import '../../view/dashboard/Trips/controller_offer.dart';
import '../../view/dashboard/Trips/false_offer_controller.dart';
import '../../view/dashboard/Trips/false_offers_service..dart';
import '../../view/dashboard/Trips/trip_pending_service.dart';
import '../../view/dashboard/Trips/true_offer_controller.dart';
import '../../view/dashboard/Trips/true_offer_service.dart';
import '../../view/dashboard/Users/all_users_controller.dart';
import '../../view/dashboard/Users/all_users_service.dart';
import '../../view/dashboard/Users/block_user_controller.dart';
import '../../view/dashboard/Users/block_users._service.dart';
import '../../view/dashboard/Users/false_users_controller.dart';
import '../../view/dashboard/Users/show_user_service.dart';
import '../../view/dashboard/Users/un_block_user_controller.dart';
import '../../view/dashboard/Users/un_block_user_service.dart';
import '../../view/dashboard/admins/show_admins_controller.dart';
import '../../view/dashboard/companies/all-companies_service.dart';
import '../../view/dashboard/companies/all_companies_controller.dart';
import '../../view/dashboard/companies/block_controller.dart';
import '../../view/dashboard/companies/false_companies_service.dart';
import '../../view/dashboard/companies/true_companies_service.dart';
import '../../view/dashboard/show compnies/accept_controller.dart';
import '../../view/dashboard/show compnies/service_show_companies.dart';
import '../../view/web/showCompany/show_company_admin_c.dart';
import '../../view/web/showCompany/show_company_admin_s.dart';

class DashBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put<ThemeController>(ThemeController(), permanent: true);
    // Get.put<WebController>(WebController(), permanent: true);
//    Get.put<SignInController>(SignInController(), permanent: true);
    //  Get.put<SignUpController>(SignUpController(), permanent: true);
    //Get.put<showCompaniesController>(showCompaniesController(),
    //  permanent: true);
    Get.put<ShowMyCompanyService>(ShowMyCompanyService(), permanent: true);
    Get.put<ShowMyCompanyController>(ShowMyCompanyController(),
        permanent: true);
    Get.put<AcceptCompanyServices>(AcceptCompanyServices(), permanent: true);
    Get.put<AcceptCompanyController>(AcceptCompanyController(),
        permanent: true);

    Get.put<SignInController>(SignInController(), permanent: true);
    Get.put<showCompaniesService>(showCompaniesService(), permanent: true);
    Get.put<BlockCompanyServices>(BlockCompanyServices(), permanent: true);
    Get.put<BlockCompanyController>(BlockCompanyController(), permanent: true);

    Get.put<dashController>(dashController(), permanent: true);
    //Get.put<showCompaniesService>(showCompaniesService(), permanent: true);
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
    Get.put<showAdminsService>(showAdminsService(), permanent: true);
    Get.put<showAdminsController>(showAdminsController(), permanent: true);
    Get.put<showCustomersActiveService>(showCustomersActiveService(),
        permanent: true);
    Get.put<showCustomersActiveController>(showCustomersActiveController(),
        permanent: true);
    Get.put<BlockCustomersServices>(BlockCustomersServices(), permanent: true);

    Get.put<BlockCustomerController>(BlockCustomerController(),
        permanent: true);
    Get.put<showAllCustomersService>(showAllCustomersService(),
        permanent: true);
    Get.put<showAllCustomersController>(showAllCustomersController(),
        permanent: true);
    Get.put<showCustomersBlockService>(showCustomersBlockService(),
        permanent: true);
    Get.put<showCustomersBlockController>(showCustomersBlockController(),
        permanent: true);
    Get.put<UnBlockUserServices>(UnBlockUserServices(), permanent: true);
    Get.put<UnBlockUserController>(UnBlockUserController(), permanent: true);
    Get.put<showOffersPendingService>(showOffersPendingService(),
        permanent: true);
    Get.put<showOffersPendingController>(showOffersPendingController(),
        permanent: true);
    Get.put<AcceptOfferServices>(AcceptOfferServices(), permanent: true);
    Get.put<AcceptOfferController>(AcceptOfferController(), permanent: true);

    Get.put<RefuseOfferServices>(RefuseOfferServices(), permanent: true);
    Get.put<RefuseOfferController>(RefuseOfferController(), permanent: true);

    Get.put<showOffersActiveService>(showOffersActiveService(),
        permanent: true);
    Get.put<showOffersActiveController>(showOffersActiveController(),
        permanent: true);

    Get.put<showOffersRefuseService>(showOffersRefuseService(),
        permanent: true);
    Get.put<showoffersRefuseController>(showoffersRefuseController(),
        permanent: true);

    Get.put<showAllOffersService>(showAllOffersService(), permanent: true);
    Get.put<showAllOffersController>(showAllOffersController(),
        permanent: true);
    // Get.put<AcceptCompanyServices>(AcceptCompanyServices(), permanent: true);
  }
}
