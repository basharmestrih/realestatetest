import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_house_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _goToNext();
  }

  void _goToNext() async {
    await Future.delayed(const Duration(seconds: 9)); // shorter splash delay

    // Check if "Remember Me" was checked and user is logged in
    final rememberMe = box.read('rememberMe') ?? false;
    final user = box.read('user');

    if (rememberMe && user != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.AUTH);
    }
  }
}
