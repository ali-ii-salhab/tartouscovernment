import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:tartouscovernment/core/constants/colors.dart';
import 'package:tartouscovernment/core/constants/route.dart';
import 'package:tartouscovernment/core/functions/customappbar.dart';
import 'package:tartouscovernment/view/Homepage/widgets/customdrawer.dart';
import 'package:tartouscovernment/view/appIcons.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/widgets/customHotelfromfield.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/widgets/custom_slide_switcher.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/widgets/customdonebutton.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/widgets/customdropbutton.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/widgets/custompersoncardoption.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/widgets/customroomoptionscard.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/widgets/roomcard.dart';

class AddCustomerDetails extends StatefulWidget {
  const AddCustomerDetails({super.key});

  @override
  State<AddCustomerDetails> createState() => _AddReservationRoomDetailsState();
}

class _AddReservationRoomDetailsState extends State<AddCustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          Container(margin: EdgeInsets.only(top: 40.sp), child: CustomDrawer()),
      body: SafeArea(
        child: Scaffold(
          appBar: customappbar(),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(bottom: 20.sp),
              child: Column(
                children: [
                  SlideSwitcher(
                    first: 'B2B',
                    second: 'B2C',
                  ),
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    child: Column(
                      children: [
                        CustomTextformfieldAddAccount(
                          title: 'Customer name',
                          hint: 'Customer name',
                        ),
                        CustomTextformfieldAddAccount(
                          isphone: true,
                          title: 'phone number',
                          hint: 'Hotel City',
                        ),
                        CustomTextformfieldAddAccount(
                          title: 'Email',
                          hint: 'Email',
                        ),
                        Container(
                            width: double.infinity,
                            height: 50.sp,
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            decoration: BoxDecoration(
                              color: AppColors.greytextformfield,
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                    Container(
                                      height: 50.h,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ...List.generate(
                                                countries.length,
                                                (index) =>
                                                    Text(countries[index].name))
                                          ],
                                        ),
                                      ),
                                    ),
                                    backgroundColor: Colors.white);
                              },
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Text(
                                  "Country",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DoneButton(ontap: () {
                          Get.toNamed(AppRoutes.AddReservatonGuestoptions);
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
