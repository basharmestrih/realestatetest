import 'package:get/get.dart';
import 'package:my_house_app/app/modules/othersdetails/controllers/othersdetails_controller.dart';
import 'package:my_house_app/app/modules/propertydetails/controllers/property_controller.dart';

class OthersdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OthersdetailsController>(() => OthersdetailsController());
  }
}
