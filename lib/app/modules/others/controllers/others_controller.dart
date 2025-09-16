import 'package:get/get.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/data/models/others_model.dart';
import 'package:my_house_app/app/modules/others/service/others_service.dart';
import 'package:my_house_app/app/modules/property/service/propertyserice.dart';

class OthersController extends GetxController {
  var othersList = <OthersModels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit(); // ✅ should be before fetch
    fetchOthersData();
  }

void fetchOthersData({String? location, String? query, int? limit}) async {
  try {
    isLoading.value = true;

    final others = await OthersService.fetchOthers(
      location: location,
      query: query,      // Pass query here
          // Pass limit here
    );

    // If limit is provided, take the first `limit` houses
    final limitedOthers = (limit != null && limit > 0)
        ? others.take(limit).toList()
        : others;

    othersList.assignAll(limitedOthers);
  } catch (e) {
    Get.snackbar('Error', 'Failed to load others');
    print('Fetch error: $e');
  } finally {
    isLoading.value = false;
  }
}

}
