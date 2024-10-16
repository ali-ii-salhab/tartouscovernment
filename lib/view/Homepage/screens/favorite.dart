import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tartouscovernment/controller/hompage/homepagecontroller.dart';
import 'package:tartouscovernment/core/class/handlingdataview.dart';
import 'package:tartouscovernment/core/functions/customappbar.dart';
import 'package:tartouscovernment/view/Homepage/widgets/bottomnavbar.dart';

class Favorite extends StatelessWidget {
  const Favorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find();

    return Container(
      // color: Colors.red,
      child: Column(
        children: [Text("favorite")],
      ),
    );
  }
}
