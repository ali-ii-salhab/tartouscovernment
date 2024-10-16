import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:tartouscovernment/core/constants/colors.dart';
import 'package:tartouscovernment/core/functions/clicable.dart';
import 'package:tartouscovernment/view/appIcons.dart';

class Callbutton extends StatelessWidget {
  VoidCallback oncall;
  Callbutton({super.key, required this.oncall});

  @override
  Widget build(BuildContext context) {
    return Clicable(
      ontap: oncall,
      child: Container(
          height: 24.sp,
          width: 20.sp,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.main),
          child: Icon(
            Icons.call,
            color: Colors.red,
            size: 18,
          )),
    );
  }
}
