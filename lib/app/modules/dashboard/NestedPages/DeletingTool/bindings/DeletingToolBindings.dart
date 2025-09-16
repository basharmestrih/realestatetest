import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/DeletingTool/controller/DeletingToolController.dart';

class DeletingToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeletingToolController>(() => DeletingToolController());
  }
}
