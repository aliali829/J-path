/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled68/view/dashboard/show%20compnies/controller_show_companies.dart';

showCompaniesController controller = Get.find();

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed("/showCompanies");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.grey,
                    ],
                  )),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.local_convenience_store,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Companies", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 50),
              InkWell(
                onTap: () {
                  //  Get.toNamed("/showCompanies");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.redAccent,
                      Colors.grey,
                    ],
                  )),
                  child: const Column(
                    children: [
                      Icon(Icons.admin_panel_settings, size: 30),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Admins", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 50),
              InkWell(
                onTap: () {
                  // Get.toNamed("/showCompanies");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.orangeAccent,
                      Colors.grey,
                    ],
                  )),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Users", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 50),
              InkWell(
                onTap: () {
                  // Get.toNamed("/showCompanies");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.pinkAccent,
                      Colors.grey,
                    ],
                  )),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.forest,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Offers", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:untitled75/view/dashboard/permitions/permitions.dart';
import 'package:untitled75/view/web/responseve.dart';

import 'dashmenu.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Responseve.isStanderdWeb(context)
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            ),
      drawer: const DashBMenu(),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1440.0,
            ),
            child: Row(
              children: [
                if (Responseve.isStanderdWeb(context))
                  const Expanded(
                    flex: 2,
                    child: DashBMenu(),
                  ),
                Expanded(
                  flex: 7,
                  child: Permissions(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
