// others_details_controller.dart
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OthersdetailsController extends GetxController {
  late  String videoUrl;
  late  String location;
  late  String address;
  late  String title;
  late  int price;
  late  String description;
  late  int floorsNumber;
  late  int? areaDistance;
  late  int? arealength;
  late  int? areawidth;
  late  bool isSell;
  late  bool isRent;
  late  List<String> mainFeatures;
  late  List<String> imgUrls;

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
    floorsNumber = args['floorsNumber'] ?? 0;
    areaDistance = args['areaDistance']; // Nullable
    arealength = args['arealength']; // Nullable
    areawidth = args['areawidth']; // Nullable
    isSell = args['isSell'] ?? false;
    isRent = args['isRent'] ?? false;
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
