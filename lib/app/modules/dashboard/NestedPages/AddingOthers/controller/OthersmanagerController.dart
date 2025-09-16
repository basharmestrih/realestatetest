import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_house_app/app/data/services/token_service.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/services/homemanager_service.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/services/othersmanager_service.dart';
import 'package:my_house_app/app/modules/others/service/others_service.dart';

class OthersManagerController extends GetxController {
  OthersmanagerService? _service;

  // Controllers
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final addressController = TextEditingController();
  final locationController = TextEditingController();
  final floorsNumberController = TextEditingController();
  final feature1Controller = TextEditingController();
  final feature2Controller = TextEditingController();
  final feature3Controller = TextEditingController();
  final areadistanceController = TextEditingController();
  final areawidthController = TextEditingController();
  final arealengthController = TextEditingController();

  // Reactive variables
  RxList<File> selectedImages = <File>[].obs;
  Rxn<File> selectedVideo = Rxn<File>();
  RxBool showOnTimeline = false.obs;
  Rxn<String> selectedCategory = Rxn<String>();
  RxBool isLoading = false.obs;
  RxInt currentStep = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _initService();
  }

  Future<void> _initService() async {
    final token = await TokenService().token;
    if (token != null) {
      _service = OthersmanagerService(token: token);
    } else {
      Get.snackbar('Error', 'No token found');
    }
  }

  // --- Step navigation ---
  void nextStep() {
    if (currentStep.value < 3) currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  void setShowOnTimeline(bool value) => showOnTimeline.value = value;
  void setSelectedCategory(String? category) => selectedCategory.value = category;

  // --- File pickers ---
  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: true);
    if (result != null) {
      selectedImages.value = result.paths.map((path) => File(path!)).toList();
    }
  }

  Future<void> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.path != null) {
      selectedVideo.value = File(result.files.single.path!);
    }
  }

  // --- Submit ---
  Future<void> submitOthers() async {
    if (_service == null) {
      Get.snackbar('Error', 'Service not initialized');
      return;
    }

    isLoading.value = true;

    final fields = {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'price': priceController.text.trim(),
      'areadistance': areadistanceController.text.trim(),
      'areawidth': areawidthController.text.trim(),
      'arealength': arealengthController.text.trim(),
      'address': addressController.text.trim(),
      'location': locationController.text.trim(),
      'floors_number': floorsNumberController.text.trim(),
      'category': selectedCategory.value ?? '',
    };

    List<String> features = [
      feature1Controller.text.trim(),
      feature2Controller.text.trim(),
      feature3Controller.text.trim(),
    ];

    for (int i = 0; i < features.length; i++) {
      if (features[i].isNotEmpty) fields['main_features[$i]'] = features[i];
    }

    final response = await _service!.finalsubmitOthers(
      fields: fields,
      images: selectedImages,
      video: selectedVideo.value,
    );

    isLoading.value = false;

    if (response == null) {
      Get.snackbar('Error', 'No response from server');
      return;
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response);
      final json = response.body.isNotEmpty ? jsonDecode(response.body) : {};
      print(json);
      Get.snackbar('Success', 'Property added successfully');

      if (json['status'] == true && showOnTimeline.value) {
        final houseId = json['data']['id'];
        await _service!.sendToFeaturedApi(houseId);
      }
    } else {
      Get.snackbar('Error', 'Failed: ${response.body}');
    }
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    areadistanceController.clear();
    areawidthController.clear();
    arealengthController.clear();
    addressController.clear();
    locationController.clear();
    floorsNumberController.clear();
    feature1Controller.clear();
    feature2Controller.clear();
    feature3Controller.clear();
    selectedImages.clear();
    selectedVideo.value = null;
    selectedCategory.value = null;
    showOnTimeline.value = false;
    currentStep.value = 0;
  }
}
