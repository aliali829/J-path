import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/view/web/cover.dart';
import 'package:untitled75/view/web/responseve.dart';
import 'package:untitled75/view/web/showCompany/show_company_admin_model.dart';
import 'package:untitled75/view/web/side_menu.dart';

import 'homePage/homepage.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  ShowCompany? myCompany;

  @override
  void initState() {
    showMyCompanyController.service.showMycompany().then((value) {
      if (value.isEmpty) return;
      setState(() => myCompany = value.first);
      if (myCompany!.status == CompanyStatus.active) {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Get.offNamed("/MainPage");
          },
        );
      }
    });

    super.initState();
  }

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
              actions: [
                IconButton(
                    onPressed: () {
                      window.location.reload();
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
      drawer: const SideMenu(),
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
                    child: SideMenu(),
                  ),
                Expanded(
                  flex: 7,
                  child: Builder(builder: (context) {
                    if (myCompany == null) {
                      return const Cover();
                    } else {
                      switch (myCompany!.status) {
                        case CompanyStatus.pending:
                          return const Center(
                            child: Text(
                              'Your Company is Pending',
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        case CompanyStatus.active:
                          return const Center(
                            child: Column(
                              children: [
                                Text(
                                  'Your Company is Active',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: 20.0),
                                CircularProgressIndicator.adaptive(),
                              ],
                            ),
                          );
                        case CompanyStatus.refuse:
                          return const Center(
                              child: Text(
                            "Your Company Is refuse",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ));
                      }
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
