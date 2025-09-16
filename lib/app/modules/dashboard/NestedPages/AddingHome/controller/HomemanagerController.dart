import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/services/homemanager_service.dart';
import 'package:my_house_app/app/data/services/token_service.dart';

class PropertyManagerController extends GetxController {
  PropertyService? _service;
  final _tokenService = TokenService();

  // -------------------- Form Controllers --------------------
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  
  final bedroomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final areaController = TextEditingController();
  final addressController = TextEditingController();
  final locationController = TextEditingController();
  final floorsNumberController = TextEditingController();
  final groundDistanceController = TextEditingController();
  final buildingAgeController = TextEditingController();
  final feature1Controller = TextEditingController();
  final feature2Controller = TextEditingController();
  final feature3Controller = TextEditingController();

  // -------------------- Media --------------------
  List<File> selectedImages = [];
  File? selectedVideo;
  bool showOnTimeline = false;

  // -------------------- States --------------------
  RxBool isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;

  // -------------------- Stepper --------------------
  int currentStep = 0;
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    _initService();
  }

  Future<void> _initService() async {
    final token = await _tokenService.token;
    if (token != null && token.isNotEmpty) {
      _service = PropertyService(token: token);
    } else {
      _service = null;
      Get.snackbar("Error", "No token found, please login again");
    }
  }

  // -------------------- Stepper Logic --------------------
  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
      pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      update();
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      pageController.animateToPage(
        currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      update();
    }
  }

  void setShowOnTimeline(bool value) {
    showOnTimeline = value;
    update();
  }

  // -------------------- File Pickers --------------------
  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null) {
      selectedImages = result.paths.map((path) => File(path!)).toList();
      update();
    }
  }

  Future<void> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.path != null) {
      selectedVideo = File(result.files.single.path!);
      update();
    }
  }

  // -------------------- Submit Property --------------------
  Future<void> submitProperty() async {
    if (_service == null) {
      Get.snackbar("Error", "Token not loaded yet");
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';
      successMessage.value = '';

      // Collect form data
      final fields = {
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim(),
        'price': priceController.text.trim(),
        'rooms_number': bedroomsController.text.trim(),
        'baths_number': bathroomsController.text.trim(),
        'area': areaController.text.trim(),
        'address': addressController.text.trim(),
        'location': locationController.text.trim(),
        'floors_number': floorsNumberController.text.trim(),
        'ground_distance': groundDistanceController.text.trim(),
        'building_age': buildingAgeController.text.trim(),
      };

      // Features array
      List<String> features = [
        feature1Controller.text.trim(),
        feature2Controller.text.trim(),
        feature3Controller.text.trim(),
      ];
      for (int i = 0; i < features.length; i++) {
        if (features[i].isNotEmpty) {
          fields['main_features[$i]'] = features[i];
        }
      }

      // Send request
      final response = await _service!.submitProperty(
        fields: fields,
        images: selectedImages,
        video: selectedVideo,
      );

      if (response == null) {
        errorMessage.value = "No response from server.";
        Get.snackbar("Error", errorMessage.value);
        return;
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.body;
        final json = data.isNotEmpty ? jsonDecode(data) : {};

        if (json['status'] == true && showOnTimeline) {
          final houseId = json['data']['id'];
          await _service!.sendToFeaturedApi(houseId);
        }

        successMessage.value = "تم إضافة العقار بنجاح";
        showSuccessDialog(successMessage.value);
        clearFields();
      } else if (response.statusCode == 400) {
        errorMessage.value = "Validation error: ${response.body}";
        Get.snackbar("Error", errorMessage.value);
      } else if (response.statusCode == 401) {
        errorMessage.value = "Unauthorized. Please login again.";
        Get.snackbar("Error", errorMessage.value);
      } else if (response.statusCode == 500) {
        errorMessage.value = "Server error. Please try again later.";
        Get.snackbar("Error", errorMessage.value);
      } else {
        errorMessage.value =
            "Unexpected error: ${response.statusCode} - ${response.body}";
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "Exception: $e";
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // -------------------- Success Dialog --------------------
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
              const Icon(Icons.check_circle, color: Colors.green, size: 60),
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

  // -------------------- Clear Fields --------------------
  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    bedroomsController.clear();
    bathroomsController.clear();
    areaController.clear();
    addressController.clear();
    locationController.clear();
    floorsNumberController.clear();
    groundDistanceController.clear();
    buildingAgeController.clear();
    feature1Controller.clear();
    feature2Controller.clear();
    feature3Controller.clear();
    selectedImages = [];
    selectedVideo = null;
    update();
  }
}
