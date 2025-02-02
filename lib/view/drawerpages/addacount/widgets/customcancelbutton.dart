import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:tartouscovernment/core/constants/colors.dart';
import 'package:tartouscovernment/core/functions/clicable.dart';
import 'package:tartouscovernment/view/appIcons.dart';

class CancelButton extends StatelessWidget {
  void Function() ontap;
  CancelButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Clicable(
      ontap: () {
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Iconify(
          AppIcons.cancel,
          color: Colors.red,
        ),
      ),
    );
  }
}
