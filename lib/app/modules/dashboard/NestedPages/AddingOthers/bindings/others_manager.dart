import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/controller/HomemanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/controller/OthersmanagerController.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';


class OthersManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OthersManagerController>(
      () => OthersManagerController(),
    );

  }
}
