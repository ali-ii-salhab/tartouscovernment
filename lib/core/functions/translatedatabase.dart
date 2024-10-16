import 'package:get/get.dart';
import 'package:tartouscovernment/core/services/services.dart';

translatedatabase(columnAR, columnEN) {
  var services = Get.find<MyServices>();
  String lan = services.shared.getString('lang').toString();
  if (lan == 'ar') {
    return columnAR;
  } else {
    return columnEN;
  }
}
