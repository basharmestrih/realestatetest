import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/DeletingTool/controller/DeletingToolController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/OthersDeletingTool/controller/OthersDeletingToolController.dart';

class OthersDeletingToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OthersDeletingToolController>(() => OthersDeletingToolController());
  }
}
