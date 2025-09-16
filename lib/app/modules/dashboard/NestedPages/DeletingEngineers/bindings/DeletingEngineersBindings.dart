import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/DeletingEngineers/controller/DeletingEngineersController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/DeletingTool/controller/DeletingToolController.dart';

class Deletingengineersbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Deletingengineerscontroller>(() => Deletingengineerscontroller());
  }
}
