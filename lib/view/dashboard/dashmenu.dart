import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/model/user.dart';
import 'package:untitled75/theme/j-path-colors.dart';
import 'package:untitled75/theme/service_theme.dart';

import '../../getx/controller/sign_in_controller.dart';
import '../../services/User_information.dart';
import 'admins/admins.dart';

SignInController controller = Get.find();
//ThemeController controller2 = Get.find();
User? user;

class DashBMenu extends StatefulWidget {
  const DashBMenu({super.key});

  @override
  State<DashBMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<DashBMenu> {
  @override
  Widget build(BuildContext context) {
    const moonIcon = CupertinoIcons.moon_stars;
    SignInController controller = Get.find();
    // ThemeController controller2 = Get.find();
    // controller2.getThemeStatus();
    return Drawer(
      // backgroundColor: Colors.orangeAccent,
      backgroundColor: JPathColors.drawerColor,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Get.toNamed("/companies");
              },
              trailing: const Text("Companies"),
              leading: Icon(Icons.store, color: Colors.brown),
            ),
            ListTile(
              onTap: () {
                Get.to(Admins());
              },
              trailing: const Text("Admins"),
              leading:
                  Icon(Icons.admin_panel_settings, color: Colors.orangeAccent),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("/users");
              },
              trailing: const Text("Users"),
              leading: Icon(Icons.account_circle, color: Colors.redAccent),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("/trips");
              },
              trailing: const Text("Trips"),
              leading: Icon(Icons.forest, color: Colors.green),
            ),
            /*ObxValue(
              (data) => Switch(
                value: Themeservice().isLightTheme.value,
                onChanged: (val) {
                  Themeservice().isLightTheme.value = val;
                  Get.changeThemeMode(
                    Themeservice().isLightTheme.value
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
                  Themeservice().saveThemeStatus();
                },
              ),
              false.obs,
            ),*/
            ListTile(
              onTap: () {
                serviceMoon().changeTheme();
              },
              trailing: const Text("Dark mode"),
              leading: Icon(Icons.dark_mode_sharp, color: Colors.grey),
            ),
            ListTile(
              onTap: () {
                controller.token = UserInformation.Admin_Token;
                clickLogoutDash();
              },
              trailing: const Text("Log-out"),
              leading:
                  Icon(Icons.logout, color: Theme.of(context).iconTheme.color),
            ),
          ],
        ),
      ),
    );
  }

  void clickLogoutDash() async {
    EasyLoading.show(status: "Loading----");
    await controller.LogOutDashClick();
    if (controller.LogOutDashStatus) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed("/LogIn");
    } else {
      EasyLoading.showError(controller.message,
          duration: const Duration(seconds: 6), dismissOnTap: true);
    }
  }
}
