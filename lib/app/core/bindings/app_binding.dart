import 'package:get/get.dart';

import '../../data/services/locale_service.dart';
import '../../modules/splash/controllers/splash_controller.dart';
import '../controllers/root_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootController());
    Get.put(SplashController());
   

  }
}
