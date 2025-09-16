import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/controller/DashBoardController.dart';

class Dashboardbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}
