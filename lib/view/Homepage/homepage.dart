import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:tartouscovernment/Apiapplink.dart';
import 'package:tartouscovernment/controller/hompage/homepagecontroller.dart';
import 'package:tartouscovernment/core/class/handlingdataview.dart';
import 'package:tartouscovernment/core/class/statusrequest.dart';
import 'package:tartouscovernment/core/constants/colors.dart';
import 'package:tartouscovernment/core/constants/imageassets.dart';
import 'package:tartouscovernment/core/functions/customappbar.dart';
import 'package:tartouscovernment/core/functions/uploadfile.dart';
import 'package:tartouscovernment/core/services/services.dart';
import 'package:tartouscovernment/view/Homepage/widgets/bottomnavbar.dart';
import 'package:tartouscovernment/view/Homepage/widgets/customdrawer.dart';
import 'package:tartouscovernment/view/Homepage/widgets/editprofile.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/ContractAttachment.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/widgets/customdonebutton.dart';
import 'package:tartouscovernment/view/test.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toggleBackgroundState = false;
  HomePageController controller = Get.put(HomePageController());

  void toggleBackgroundImage() {
    setState(() {
      toggleBackgroundState = !toggleBackgroundState;
    });
  }

  @override
  Widget build(BuildContext context) {
    MyServices serv = Get.find();

    return Scaffold(
        drawer: Container(
            margin: EdgeInsets.only(top: 40.sp), child: CustomDrawer()),
        body: SafeArea(
            child: Scaffold(
                body: GetBuilder<HomePageController>(
                  builder: (controller) =>
                      controller.screens[controller.currentindex],
                ),
                appBar: AppBar(),
                backgroundColor: Colors.white,
                extendBody: true, // <--- do not forget mark this as true
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: AppBarGod())));
  }
}
