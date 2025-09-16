// property_details_controller.dart
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailsController extends GetxController {
  late final String videoUrl;
  late final String location;
  late final String address;
  late final String title;
  late final String price;
  late final String description;
  late final int roomsNumber;
  late final int bathsNumber;
  late final int floorsNumber;
  late final int groundDistance;
  late final int buildingAge;
  late final bool isSell;
  late final bool isRent;
  late final bool isFurnitured;
  late final List<String> mainFeatures;
  late final List<String> imgUrls;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;

    videoUrl = args['videoUrl'] ?? '';
    location = args['location'] ?? '';
    address = args['address'] ?? '';
    title = args['title'] ?? '';
    price = args['price'] ?? '';
    description = args['description'] ?? '';
    roomsNumber = args['roomsNumber'] ?? 0;
    bathsNumber = args['bathsNumber'] ?? 0;
    floorsNumber = args['floorsNumber'] ?? 0;
    groundDistance = args['groundDistance'] ?? 0;
    buildingAge = args['buildingAge'] ?? 0;
    isSell = args['isSell'] ?? false;
    isRent = args['isRent'] ?? false;
    isFurnitured = args['isFurnitured'] ?? false;
    mainFeatures = List<String>.from(args['mainFeatures'] ?? []);
    imgUrls = List<String>.from(args['imgUrls'] ?? []);
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
