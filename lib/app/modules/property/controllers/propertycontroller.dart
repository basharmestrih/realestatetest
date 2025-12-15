import 'package:get/get.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/modules/property/service/propertyserice.dart';

class PropertyController extends GetxController {
  var houseList = <HomeModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit(); // ✅ should be before fetch
    fetchHouses();
  }

void fetchHouses({String? location, String? query, int? limit}) async {
  try {
    isLoading.value = true;

    final houses = await ProperttService.fetchHouses(
      location: location,
      query: query,      // Pass query here
          // Pass limit here
    );

    // If limit is provided, take the first `limit` houses
    final limitedHouses = (limit != null && limit > 0)
        ? houses.take(limit).toList()
        : houses;
    // ✅ Sort houses by id descending (bigger → smaller)
    limitedHouses.sort((a, b) => b.id.compareTo(a.id));

    houseList.assignAll(limitedHouses);
  } catch (e) {
    //Get.snackbar('Error', 'Failed to load houses');
    print('Fetch error: $e');
  } finally {
    isLoading.value = false;
  }
}

}
