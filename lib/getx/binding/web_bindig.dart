import 'package:get/get.dart';
import 'package:untitled75/getx/controller/web_screen_controller.dart';
import 'package:untitled75/view/dashboard/show%20compnies/accept_company_service.dart';

import '../../view/dashboard/companies/true_companies_service.dart';
import '../../view/dashboard/show compnies/service_show_companies.dart';
import '../../view/web/homePage/booking/customers/controller_customers.dart';
import '../../view/web/homePage/delete_company/delete_company_controller.dart';
import '../../view/web/homePage/delete_company/delete_company_service.dart';
import '../../view/web/homePage/delete_trip/controller_delete_trip.dart';
import '../../view/web/homePage/detailes_of_trips/controller_detailes.dart';
import '../../view/web/homePage/home_page_controller.dart';
import '../../view/web/homePage/my_trips/controller_my_trips.dart';
import '../../view/web/homePage/pofile/controller_profile.dart';
import '../../view/web/showCompany/show_company_admin_c.dart';
import '../../view/web/showCompany/show_company_admin_s.dart';
import '../../view/web/show_wallet/controller_balance.dart';
import '../../view/web/state booking/controller_accept_booking.dart';
import '../../view/web/state booking/controller_booking.dart';
import '../../view/web/state booking/controller_refuse_booking.dart';
import '../../view/web/state booking/service_Bookings.dart';
import '../../view/web/state booking/service_accept_booking.dart';
import '../controller/create_trip_controller.dart';
import '../controller/sign_in_controller.dart';
import '../controller/sign_up_controller.dart';

class WebBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<ShowMyCompanyService>(ShowMyCompanyService(), permanent: true);
    Get.put<DeleteCompanyServices>(DeleteCompanyServices(), permanent: true);
    Get.put<DeleteCompanyController>(DeleteCompanyController(),
        permanent: true);
    Get.put<showAllBookingsService>(showAllBookingsService(), permanent: true);
    Get.put<showAllBookingsController>(showAllBookingsController(),
        permanent: true);
    Get.put<acceptBookingServices>(acceptBookingServices(), permanent: true);
    Get.put<showAdminOffersController>(showAdminOffersController(),
        permanent: true);
    Get.put<showMyCustomeController>(showMyCustomeController(),
        permanent: true);

    Get.put<DeleteTripController>(DeleteTripController(), permanent: true);
    Get.put<acceptBookingController>(acceptBookingController(),
        permanent: true);
    Get.put<showBalanceController>(showBalanceController(), permanent: true);
    Get.put<refuseBookingController>(refuseBookingController(),
        permanent: true);
    Get.put<showAllBookingsController>(showAllBookingsController(),
        permanent: true);
    Get.put<WebController>(WebController(), permanent: true);
    Get.put<CreateTripController>(CreateTripController(), permanent: true);
    Get.put<showDetailesController>(showDetailesController(), permanent: true);
    Get.put<HomePageController>(HomePageController(), permanent: true);
    Get.put<SignInController>(SignInController(), permanent: true);
    Get.put<SignUpController>(SignUpController(), permanent: true);
    //Get.put<showCompaniesController>(showCompaniesController(),
    //  permanent: true);

    Get.put<showCompaniesService>(showCompaniesService(), permanent: true);

    Get.put<showCompaniesActiveService>(showCompaniesActiveService(),
        permanent: true);
    Get.put<showMyProfileController>(showMyProfileController(),
        permanent: true);
    //Get.put<AcceptCompanyController>(AcceptCompanyController(),
    //permanent: true);
    Get.put<AcceptCompanyServices>(AcceptCompanyServices(), permanent: true);
    Get.put<ShowMyCompanyController>(ShowMyCompanyController(),
        permanent: true);
  }
}
