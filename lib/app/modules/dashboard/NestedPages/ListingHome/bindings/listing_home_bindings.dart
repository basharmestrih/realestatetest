import 'package:get/get.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';


class ListingHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyController>(
      () => PropertyController(),
    );
  }
}
