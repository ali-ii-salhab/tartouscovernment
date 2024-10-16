import 'package:get/get.dart';
import 'package:tartouscovernment/core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    print('init binging');
    Get.put(Crud());
  }
}
