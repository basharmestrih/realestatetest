import 'package:get/get.dart';
import 'package:my_house_app/app/modules/propertydetails/controllers/property_controller.dart';

class PropertyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyDetailsController>(() => PropertyDetailsController());
  }
}
