// device_utils.dart
import 'package:get/get.dart';


class DeviceUtils {
  
  static bool isPhone() => Get.width < 800;
  static bool isTablet() => Get.width >= 800 && Get.width < 1024;
}
