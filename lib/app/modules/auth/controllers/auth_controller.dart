import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../../data/models/user_model.dart';
import '../../../data/services/api_endpoints.dart';
import '../../../data/services/api_service.dart';
import '../../../data/services/token_service.dart';
import '../../../routes/app_pages.dart';


class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordHidden = true.obs;
  final box = GetStorage();
  final tokenService = TokenService();
  var rememberMe = false.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    isLoading.value = true;

    try {
      final response = await ApiService().postApi(
        url: ApiEndpoints.login,
        body: {
          'email': email,
          'password': password,
        },
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        final body = response.body;

        final status = body['status'];
        final message = body['message'];

        if (status == true) {
          final data = body['data'];

          // Convert JSON to model
          final accessToken = data['access_token'];
          final userJson = data['user'];
          userJson['token'] = accessToken;

          final user = UserModel.fromJson(userJson);

          // Save token securely
          await tokenService.saveToken(user.token);

          if (rememberMe.value) {
            box.write('rememberMe', true);
          } else {
            box.write('rememberMe', false);
          }


          // Save user data to GetStorage
          box.write('user', user.toJson());

          Get.offAllNamed(Routes.HOME);
          //Get.snackbar('Success', message ?? 'Login successful');
        } else {
          Get.snackbar('Login Failed', message ?? 'Unknown error');
        }
      } else {
        Get.snackbar('Login Failed', 'Something went wrong. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  UserModel? get currentUser {
    final json = box.read('user');
    if (json != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(json));
    }
    return null;
  }
  // Function to check if the current user is an admin
Future<bool> isAdmin(AuthController authController) async {
  final user = authController.currentUser; // Get current user

  return user?.role == 'admin'; // Check if the user's name is "Admin User"
}

  Future<void> logout() async {
    await tokenService.removeToken();
    box.erase(); // clears GetStorage
    Get.offAllNamed(Routes.AUTH);
  }

  bool get isLoggedIn => box.hasData('user');
}
