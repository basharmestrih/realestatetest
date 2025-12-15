import 'package:get/get.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:my_house_app/app/modules/home/services/featured_house_service.dart';
import 'package:my_house_app/app/modules/others/controllers/others_controller.dart';

class HomeController extends GetxController {
  final HouseService _houseService = HouseService();
     final authController = Get.find<AuthController>();
          final otherscontroller = Get.put(OthersController());



  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxList<HomeModel> featuredHouses = <HomeModel>[].obs;

    @override
  void onInit() {
    super.onInit(); // ✅ should be before fetch
    fetchFeaturedHouse();
  }

void fetchFeaturedHouse() async {
  isLoading.value = true;
  errorMessage.value = '';

  final results = await _houseService.fetchFeaturedHouses();
  if (results != null && results.isNotEmpty) {
    featuredHouses.assignAll(results);
  } else {
    errorMessage.value = 'Failed to load featured houses';
  }

  isLoading.value = false;
}

}
