import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';
import 'package:my_house_app/app/data/services/token_service.dart';

class Deletingengineerscontroller extends GetxController {
  final TextEditingController idController = TextEditingController();
  var isLoading = false.obs;

  /// Use baseUrl and endpoint from ApiEndpoints
  final String baseUrl = ApiEndpoints.baseUrl;
  final String endpoint = ApiEndpoints.architects;

  @override
  void onClose() {
    idController.dispose();
    super.onClose();
  }

  Future<void> deleteArchitect() async {
    final id = idController.text.trim();
    if (id.isEmpty) {
      Get.snackbar('خطأ', 'الرجاء إدخال رقم المعماري');
      return;
    }

    final url = Uri.parse('$baseUrl$endpoint/$id');
    final tokenService = TokenService();
    final token = await tokenService.token;

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
        idController.clear();
        showDialogMessage("تم حذف المعماري بنجاح", true);
      } else {
        final body = json.decode(response.body);
        String errorMessage = body['message'] ?? 'حدث خطأ غير معروف';
        showDialogMessage(errorMessage, false);
      }
    } catch (e) {
      showDialogMessage("حدث خطأ: $e", false);
    } finally {
      isLoading.value = false;
    }
  }

  void showDialogMessage(String message, bool success) {
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
              Icon(
                success ? Icons.check_circle : Icons.error,
                color: success ? Colors.green : Colors.red,
                size: 60,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
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
}
