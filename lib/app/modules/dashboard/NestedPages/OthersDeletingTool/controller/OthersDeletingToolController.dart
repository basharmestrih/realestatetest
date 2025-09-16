import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';
import 'package:my_house_app/app/data/services/token_service.dart';

class OthersDeletingToolController extends GetxController {
  final TextEditingController idcontroller = TextEditingController();
  var isLoading = false.obs;

  final String baseUrl = ApiEndpoints.baseUrl;

  Future<void> deleteOthers() async {
    final tokenService = TokenService();
    final token = await tokenService.token;
    final id = idcontroller.text.trim();

    if (id.isEmpty) {
      Get.snackbar("خطأ", "الرجاء إدخال رقم العقار");
      return;
    }

    final url = Uri.parse('$baseUrl/api/others/$id');

    try {
      isLoading.value = true;

      final response = await http.delete(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        idcontroller.clear();
        showSuccessDialog("تم حذف العقار بنجاح ");
      } else {
        String message = 'فشل في حذف العقار';
        try {
          final body = jsonDecode(response.body);
          if (body is Map<String, dynamic> && body.containsKey('message')) {
            message = body['message'];
          }
        } catch (_) {}
        Get.snackbar("خطأ", message);
      }
    } catch (e) {
      Get.defaultDialog(
        title: "خطأ",
        middleText: "حدث خطأ: $e",
        textConfirm: "موافق",
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void showSuccessDialog(String message) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 2,
                  ),
                  onPressed: () => Get.back(),
                  child: const Text(
                    "موافق",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    idcontroller.dispose();
    super.onClose();
  }
}
