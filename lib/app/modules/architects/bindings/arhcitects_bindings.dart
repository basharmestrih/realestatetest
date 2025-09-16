import 'package:get/get.dart';
import 'package:my_house_app/app/modules/architects/controllers/arhcitects_controller.dart';


class ArchitectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArchitectsController>(
      () => ArchitectsController(),
    );
  }
}