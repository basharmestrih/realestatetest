import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/controller/adding_engineer_controller.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/view/adding_engineer.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/controller/HomemanagerController.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';


class AddingEngineerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddingEngineerController>(
      () => AddingEngineerController(),
    );

  }
}
