import 'package:get/get.dart';
import 'package:my_house_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:my_house_app/app/routes/app_pages.dart';

class DashBoardController extends GetxController {
     final authController = Get.find<AuthController>();

  final List<String> cardPages = [
    Routes.PROPERTYMANAGER,
    Routes.DeletingTool,
    Routes.AddingEngineer,
    Routes.DeletingEngineer,
    Routes.OTHERSMANAGER,
    Routes.OTHERSDELETINGTOOL,

  ];

  void onCardTap(int index) {
    if (index >= 0 && index < cardPages.length) {
      final pageRoute = cardPages[index];
      print('Navigating to $pageRoute');
      Get.toNamed(pageRoute);
    } else {
      print('Invalid index: $index');
    }
  }
}
