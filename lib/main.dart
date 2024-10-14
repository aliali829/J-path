import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled75/getx/binding/dash_binding.dart';
import 'package:untitled75/getx/binding/forget_controller_binding.dart';
import 'package:untitled75/getx/binding/sign_up_binding.dart';
import 'package:untitled75/getx/binding/theme-binding.dart';
import 'package:untitled75/getx/binding/web_bindig.dart';
import 'package:untitled75/theme/service_theme.dart';
import 'package:untitled75/theme/theme_service.dart';
import 'package:untitled75/view/dashboard/Login.dart';
import 'package:untitled75/view/dashboard/Trips/trip_binding.dart';
import 'package:untitled75/view/dashboard/Trips/trips.dart';
import 'package:untitled75/view/dashboard/Users/users.dart';
import 'package:untitled75/view/dashboard/companies/companies.dart';
import 'package:untitled75/view/dashboard/dashboard.dart';
import 'package:untitled75/view/dashboard/show%20compnies/accept_company_binding.dart';
import 'package:untitled75/view/signIn/sign_in.dart';
import 'package:untitled75/view/signUp/extra_information.dart';
import 'package:untitled75/view/web/homePage/detailes_of_trips/detailes%20_trips.dart';
import 'package:untitled75/view/web/homePage/homepage.dart';
import 'package:untitled75/view/web/homePage/my_trips/my_trip.dart';
import 'package:untitled75/view/web/homePage/pofile/change/change.dart';
import 'package:untitled75/view/web/show_wallet/balance.dart';
import 'package:untitled75/view/web/show_wallet/show_wallet.dart';
import 'package:untitled75/view/web/trips/create_trip_tab.dart';
import 'package:untitled75/view/web/webScreen.dart';

import '../cache/cache_healper.dart';
import '../getx/binding/sign_in_binding.dart';
import '../view/forgetPassword/create_new_password.dart';
import '../view/forgetPassword/forget_password.dart';
import '../view/signUp/Sign_up.dart';
import '../view/signUp/confirm_email.dart';

var token;

void main() async {
  // await GetStorage.init();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //String? token = prefs.getString("${UserInformation.Admin_Token}");
  await CacheHelper().init();
  token = CacheHelper().getData(key: "AdminToken");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  MyApp() {
    Themeservice().getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    // ThemeController controller = Get.find();
    return GetMaterialApp(
      theme: serviceMoon().Light_theme,
      darkTheme: serviceMoon().Dark_theme,
      themeMode: serviceMoon().getThemeMode(),
      initialRoute: token != null && token != "" ? "/WebScreen" : "/SignIn",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      getPages: [
        GetPage(
          name: "/Balance",
          page: () => ShowBalance(),
          bindings: [
            SignUpBinding(),
            WebBinding(),
          ],
          //binding: WebBinding(),
        ),
        GetPage(
          name: "/WebScreen",
          page: () => WebScreen(),
          bindings: [ThemeBinding(), WebBinding(), DashBinding()],
          //binding: WebBinding(),
        ),
        GetPage(
          name: "/DashBoard",
          page: () => Dashboard(),
          bindings: [
            DashBinding(),
          ],
          //binding: WebBinding(),
        ),
        GetPage(
          name: "/Wallet",
          page: () => Wallet(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: "/ChangePassword",
          page: () => ChangePassword(),
          binding: SignUpBinding(),
        ),
        GetPage(name: "/LogIn", page: () => Login()),
        GetPage(
            name: "/MainPage",
            page: () => HomePage(),
            bindings: [SignInBinding(), WebBinding()]),
        GetPage(
            name: "/tripAdDetailes",
            page: () => TripAdDetailes(
                  id: Get.arguments,
                ),
            bindings: [SignInBinding(), WebBinding()]),
        GetPage(
            name: "/SignIn",
            page: () => SignIn(),
            bindings: [SignInBinding(), WebBinding()]),
        GetPage(
          name: "/SignUp",
          page: () => SignUp(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: "/confirm",
          page: () => ConfirmEmail(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: "/forget",
          page: () => ForgetPassword(),
          binding: ForgetBinding(),
        ),
        GetPage(
          name: "/create",
          page: () => CreateNewPassword(),
          binding: ForgetBinding(),
        ),
        GetPage(
          name: "/extra",
          page: () => ExtranInformation(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: "/companies",
          page: () => Companies(),
          binding: ShowCompaniesBinding(),
        ),
        GetPage(
          name: "/users",
          page: () => Users(),
        ),
        GetPage(
          name: "/trips",
          page: () => Trips(),
          binding: TripBinding(),
        ),
        GetPage(
          name: "/trip",
          page: () => TripPage(tripId: Get.arguments),
          binding: TripBinding(),
        ),
        GetPage(
          name: "/CreateTripPage",
          page: () => CreateTripTab(trip: Get.arguments),
          binding: TripBinding(),
        ),
        /*GetPage(
          name: "/showCompanies",
          page: () => ShowCompanies(),
          binding: ShowCompaniesBinding(),
        ),*/
      ],
      builder: EasyLoading.init(),
    );
  }
}
