import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:sizer/sizer.dart';
import 'package:tartouscovernment/core/class/statusrequest.dart';
import 'package:tartouscovernment/core/functions/handlingdata.dart';
import 'package:tartouscovernment/core/services/services.dart';
import 'package:tartouscovernment/data/datasource/remote/addaccountdata/addacountdata.dart';
import 'package:tartouscovernment/data/model/Country_city.dart';
import 'package:tartouscovernment/data/model/hotelmodel.dart';
import 'package:tartouscovernment/data/model/hotelmodel.dart';

class AddAccountController extends GetxController {
  List<HotelModel> hotels = [];
  RxBool isfiltered = false.obs;
  List<HotelModel> get filteredHotels => isfiltered.value
      ? hotels
              .where((h) =>
                  h.country!.toLowerCase().contains(cityfilter.toLowerCase()))
              .toList() +
          hotels
              .where((element) => element.country!
                  .toLowerCase()
                  .contains(countryfilter.toLowerCase()))
              .toList()
      : hotels;

  List<CountryCityModel> CSC = [];
  List<Country> selectedcountryasmodels = [];
  Country? selectedcountry;
  List<Country> countreyfilter = [];
  String cityfilter = "";
  String countryfilter = "";

  Statusrequest statusrequest = Statusrequest.none;
  AddAccountData accountData = AddAccountData(Get.find());
  File? uplodedexcelfile;
  uploadexcelfiles() async {
    print('uploading files function');
    Get.defaultDialog(
        barrierDismissible: false,
        title: "processing",
        content: Container(
          width: 20.sp,
          height: 20.sp,
          child: CircularProgressIndicator(),
        ));

    var response = await accountData.uploadexcelfiles(uplodedexcelfile!);
    print(response);
    Get.back();
    if (response['status'] == 'success') {
      await viewhotels();
    } else {
      Get.defaultDialog(
          barrierDismissible: false,
          title: "processing",
          content: Container(
            width: 20.sp,
            height: 20.sp,
            child: Text("Error uploading excel file"),
          ));
    }

    print(response);
  }

  viewhotels() async {
    print('Getting data');
    statusrequest = Statusrequest.loading;
    update();
    var response = await accountData.gethotles();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List data = response['data'];
        hotels.addAll(data.map((e) => HotelModel.fromJson(e)));
        print(hotels);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  deletehotel(String hotelid) async {
    print('Getting data');
    Get.back();
    Get.defaultDialog(
        barrierDismissible: false,
        title: "processing",
        content: Container(
          width: 20.sp,
          height: 20.sp,
          child: CircularProgressIndicator(),
        ));

    statusrequest = Statusrequest.loading;
    update();
    var response = await accountData.deletehotle(hotelid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        Get.back();
        print(response);
        hotels.removeWhere((element) => element.id == hotelid);
        print("delete hotel successfully");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    MyServices ser = Get.find();

    print("==================token validate if expired ");
    print('init add account controller ----------->');
    viewhotels();
    // TODO: implement onInit
    super.onInit();
  }
}
