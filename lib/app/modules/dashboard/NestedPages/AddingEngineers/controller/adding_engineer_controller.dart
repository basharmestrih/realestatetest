import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/services/adding_engineer_service.dart';
import 'package:my_house_app/app/data/services/token_service.dart';

class AddingEngineerController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt currentStep = 0.obs;
  AddingEngineerService? _service;
  final _tokenService = TokenService();

  final nameController = TextEditingController();
  final specializationController = TextEditingController();
  final universityController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final experienceController = TextEditingController();
  final languagesController = TextEditingController();
  final yearsExperienceController = TextEditingController();
  final phoneController = TextEditingController();

  Rx<File?> selectedFile = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    _initService();
  }

  Future<void> _initService() async {
    final token = await _tokenService.token;
    if (token != null) {
      _service = AddingEngineerService(token: token);
    } else {
      Get.snackbar("Error", "No token found, please login again");
    }
  }

  /// Pick an image from device
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      selectedFile.value = File(result.files.single.path!);
    }
  }


  void nextStep() {
    if (currentStep.value < 2) {
      currentStep.value++;
    } 
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  /// Submit engineer profile
  Future<void> submitProfile() async {
    if (_service == null) {
      Get.snackbar("Error", "Token not loaded yet");
      return;
    }

    isLoading.value = true;

    final fields = {
      'name': nameController.text.trim(),
      'specialization': specializationController.text.trim(),
      'university': universityController.text.trim(),
      'country': countryController.text.trim(),
      'city': cityController.text.trim(),
      'experience': experienceController.text.trim(),
      'languages': languagesController.text.trim(),
      'years_experience': yearsExperienceController.text.trim(),
      'phone': phoneController.text.trim(),
    };

    final response = await _service!.submitProfile(fields, selectedFile.value);

    isLoading.value = false;

    if (response?.statusCode == 200 || response?.statusCode == 201) {
      print(response);
      showSuccessDialog("تمت إضافة المهندس إلى قاعدة البيانات");
      //clearFields();
    } else {
      Get.snackbar('Error', 'Failed to add engineer');
      print('Error response: ${response?.body}');
    }
  }

  void clearFields() {
    nameController.clear();
    specializationController.clear();
    universityController.clear();
    countryController.clear();
    cityController.clear();
    experienceController.clear();
    languagesController.clear();
    yearsExperienceController.clear();
    phoneController.clear();
    selectedFile.value = null;
    currentStep.value = 0;
  }

  void showSuccessDialog(String message) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 60),
              const SizedBox(height: 12),
              Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Get.back(),
                  child: const Text("موافق", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
