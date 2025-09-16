import 'package:get/get.dart';
import 'package:my_house_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';

import '../controllers/mainbar_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainbarController>(
      () => MainbarController(),
    );
        Get.lazyPut<PropertyController>(() => PropertyController()); 
        Get.lazyPut<HomeController>(() => HomeController()); 


  }
}
