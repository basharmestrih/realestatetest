import 'package:get/get.dart';
import 'package:my_house_app/app/modules/askforad/controllers/AskForAdController.dart';
import 'package:my_house_app/app/modules/dashboard/controller/DashBoardController.dart';

class Askforadbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Askforadcontroller>(() => Askforadcontroller());
  }
}
