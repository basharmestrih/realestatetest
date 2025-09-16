import 'package:get/get.dart';
import 'package:my_house_app/app/data/models/arhcitect_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/services/api_endpoints.dart';
import '../../../data/services/api_service.dart';

class ArchitectsController extends GetxController {
  final RxList<Architect> architects = <Architect>[].obs;
  final RxBool isLoading = true.obs;
  final RxInt currentPage = 1.obs;
  final RxBool hasMore = true.obs;

  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    print('fetchingggggg');
    fetchArchitects();
  }

  Future<void> fetchArchitects({bool loadMore = false}) async {
    if (!loadMore) {
      architects.clear();
      currentPage.value = 1;
      hasMore.value = true;
    }

    try {
      isLoading.value = true;
      final response = await apiService.getApi(
        url: "${ApiEndpoints.architects}?page=${currentPage.value}",
      );

      final dataList = response.body['data']['data'] as List;
      final totalPages = response.body['data']['last_page'];
      final newArchitects = dataList.map((e) => Architect.fromJson(e)).toList();

      architects.addAll(newArchitects);
      if (currentPage.value >= totalPages) {
        hasMore.value = false;
      } else {
        currentPage.value++;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
      Future<void> openWhatsApp(String phoneNumber, ) async {
  final Uri whatsappUrl = Uri.parse(
    "https://wa.me/$phoneNumber",
  );

  if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
    throw Exception("Could not launch $whatsappUrl");
  }
}



}
