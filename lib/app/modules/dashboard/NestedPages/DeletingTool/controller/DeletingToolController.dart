import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';
import 'dart:convert';

import 'package:my_house_app/app/data/services/token_service.dart';

class DeletingToolController extends GetxController {
  final TextEditingController idcontroller = TextEditingController();

  // Observable loading state
  var isLoading = false.obs;

  // Use the base URL from ApiEndpoints
  final String baseUrl = ApiEndpoints.baseUrl; 

  Future<void> deleteProperty() async {

    final tokenService = TokenService();
    final token = await tokenService.token;
    final id = idcontroller.text.trim();

    if (id.isEmpty) {
      Get.snackbar('خطأ', 'الرجاء إدخال رقم العقار');
      return;
    }

    final url = Uri.parse('$baseUrl/api/houses/$id'); // Construct the URL using baseUrl

    try {
      isLoading.value = true;

      final response = await http.delete(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200 || response.statusCode == 204) {
        // ✅ Success response -> show popup in Arabic
        idcontroller.clear();
       
        showSuccessDialog("تم حذف العقار بنجاح ");

      

      }
    } catch (e) {
      Get.defaultDialog(
        title: "خطأ",
        middleText: "حدث خطأ: $e",
        textConfirm: "موافق",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    idcontroller.dispose();
    super.onClose();
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
            // ✅ Icon
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 60,
            ),
            const SizedBox(height: 12),

            

            // ✅ Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Button
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
                onPressed: () {
                  Get.back();
                },
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


