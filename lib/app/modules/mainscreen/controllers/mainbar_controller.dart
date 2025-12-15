import 'package:get/get.dart';
import 'package:my_house_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:my_house_app/app/modules/others/controllers/others_controller.dart';

class MainbarController extends GetxController {
  final authController = Get.find<AuthController>();
  final otherscontroller = Get.put(OthersController());

  var selectedIndex = 0.obs;

  Future<bool> checkIfUserIsAdmin() async {
    return await authController.isAdmin(authController); 
  }

  // Change body by index
  void changeBody(int index) {
    selectedIndex.value = index;
  }

  // Change body by name
  void changeBodyByName(String bodyName) {
    switch (bodyName.toLowerCase()) {
      case "home":
        selectedIndex.value = 0;
        break;
      case "property":
        selectedIndex.value = 1;
        break;
      case "others":
        selectedIndex.value = 2;
        break;
      case "architects":
        selectedIndex.value = 3;
        break;
      default:
        selectedIndex.value = 0; // fallback to Home
        break;
    }
  }
}
