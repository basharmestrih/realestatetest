import 'package:get/get.dart';
import 'package:my_house_app/app/modules/others/controllers/others_controller.dart';


class OthersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OthersController>(
      () => OthersController(),
    );
  }
}
