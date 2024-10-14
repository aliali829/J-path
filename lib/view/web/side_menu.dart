import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/sign_up_controller.dart';
import 'package:untitled75/model/user.dart';
import 'package:untitled75/theme/j-path-colors.dart';
import 'package:untitled75/theme/theme_service.dart';
import 'package:untitled75/view/web/goals.dart';
import 'package:untitled75/view/web/homePage/delete_company/delete_company_controller.dart';
import 'package:untitled75/view/web/showCompany/show_company_admin_c.dart';

import '../../getx/controller/sign_in_controller.dart';
import '../../services/User_information.dart';
import '../../widget/image_picker.dart';
import '../../widget/logo.dart';

SignInController controller = Get.find();
//ThemeController controller2 = Get.find();
SignUpController controller3 = Get.find();
DeleteCompanyController controller4 = Get.find();
ShowMyCompanyController controller5 = Get.find();
User? user;

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
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
            AspectRatio(
              aspectRatio: 1.23,
              child: Container(
                color: JPathColors.profileColor,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(flex: 2),
                    Logo(),
                    Spacer(),
                    Text(
                      "J-Path",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: JPathColors.text2,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Add tourist offers and\n mange reservations",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 10,
                        color: JPathColors.text2,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: controller3.statusAdd
                      ? Column(
                          children: [
                            const Column(
                              children: [
                                PickImageWidget(),
                                Text("Hi"),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                      ' change to ${Themeservice().isLightTheme.value ? 'Dark' : 'Light'} theme',
                                    ),
                                  ),
                                  ObxValue(
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
                                  )
                                ]),

                            /* Obx(() {
                                return SwitchListTile(
                                    splashRadius: 5,
                                    title: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.dark_mode_sharp,
                                            color: JPathColors.icon,
                                          ),
                                          Spacer(),
                                          Text("dark mode"),
                                          Spacer(),
                                        ]),
                                    value: controller2.check.value,
                                    onChanged: controller2.updateTheme);
                              }),*/

                            ListTile(
                              onTap: () {
                                controller.token = UserInformation.Admin_Token;
                                clickLogout();
                              },
                              leading: const Text("Log-out"),
                              trailing: Icon(Icons.logout,
                                  color: Theme.of(context).iconTheme.color),
                            ),
                            ListTile(
                              onTap: () {
                                //   UserInformation.Cpmpany_id =
                                //     controller5.companiesList[index].id;
                                delete();
                              },
                              leading: const Text("Delete Company"),
                              trailing: Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            )
                            /*IconButton(
                                  onPressed: () {
                                    setState(() {
                                      ThemeService().changeTheme();
                                    });
                                  },
                                  icon: Icon(
                                    moonIcon,
                                    color: Theme.of(context).iconTheme.color,
                                  ))*/
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Goals(),
                            ListTile(
                              onTap: () {
                                controller.token = UserInformation.Admin_Token;
                                clickLogout();
                              },
                              leading: const Text("Log-out"),
                              trailing: Icon(Icons.logout,
                                  color: Theme.of(context).iconTheme.color),
                            ),
                          ],
                        )),
            )
          ],
        ),
      ),
    );
  }

  void clickLogout() async {
    EasyLoading.show(status: "Loading----");
    await controller.LogOutClick();
    if (controller.LogOutStatus) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed("/SignUp");
    } else {
      EasyLoading.showError(controller.message,
          duration: const Duration(seconds: 6), dismissOnTap: true);
    }
  }

  void delete() async {
    print(UserInformation.Cpmpany_id.toString());
  }

  void clickDeleteCompany() async {
    EasyLoading.show(status: "Loading----");
    await controller4.DeleteCompanyOnClick();
    if (controller4.status) {
      EasyLoading.showSuccess("sucses");
      Get.offNamed("/SignUp");
    } else {
      EasyLoading.showError(
        // controller.message,
        "error",
        duration: const Duration(seconds: 6),
        dismissOnTap: true,
      );
    }
  }
}
