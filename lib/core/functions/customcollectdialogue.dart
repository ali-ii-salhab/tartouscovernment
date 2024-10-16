import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:tartouscovernment/core/constants/apptextstyle.dart';
import 'package:tartouscovernment/core/constants/colors.dart';
import 'package:tartouscovernment/view/appIcons.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/widgets/customdonebutton.dart';

Future collectdialogue({required String title}) {
  return Get.defaultDialog(
      title: title,
      content: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Amount',
                    style: AppTextStyle.mainbold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30.sp),
                  width: 20.w,
                  height: 50.sp,
                  padding: EdgeInsets.all(4.sp),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(12.sp),
                      ))),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'remaining',
                  style: AppTextStyle.mainbold,
                ),
                SizedBox(
                  width: 30.sp,
                ),
                Text(
                  r"50 $",
                  style: AppTextStyle.warninrred,
                )
              ],
            ),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              children: [
                Text(
                  'Reciept',
                  style: AppTextStyle.mainbold,
                ),
              ],
            ),
            SizedBox(
              height: 20.sp,
            ),
            SizedBox(
              height: 20.sp,
            ),
            DoneButton(ontap: () {
              Get.back(canPop: false);
            }),
          ],
        ),
      ));
}
