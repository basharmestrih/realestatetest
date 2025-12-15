import 'package:get/get.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class Askforadcontroller extends GetxController {
        Future<void> openWhatsApp(String phoneNumber, ) async {
  final Uri whatsappUrl = Uri.parse(
    "https://wa.me/$phoneNumber",
  );

  if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
    throw Exception("Could not launch $whatsappUrl");
  }
}
  Future<void> openInstagram() async {
    final Uri instaUrl = Uri.parse("https://www.instagram.com/sorina_official1/");

    if (!await launchUrl(instaUrl, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $instaUrl");
    }
  }

  Future<void> openMessenger() async {
    final Uri messengerUrl = Uri.parse("https://www.facebook.com/share/15qksBYLWa/?mibextid=wwXIfr");

    if (!await launchUrl(messengerUrl, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $messengerUrl");
    }
  }
}


