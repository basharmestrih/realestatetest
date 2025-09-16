import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/widgets/input_text_form_field.dart';
import '../../../core/theme/colors.dart';
import '../../../core/util/device_utils.dart';
import '../../../data/services/validator_service.dart';
import '../../../widgets/input_text_form_field_with_label.dart';
import '../../../widgets/responsive_buttun.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.grey.withOpacity(0.2),
        elevation: 0, // Remove the shadow of the app bar
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.fontcolor), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Opacity Layer
          Container(
            color: AppColors.grey.withOpacity(0.2),
          ),
          Form(
            key: registerFormKey,
            child: ListView(
              padding: EdgeInsets.zero, // Remove default padding
              children: [
                Container(
                  //color: Colors.black,
                  alignment: Alignment.topCenter,
                  height: 300.h,
                  margin: EdgeInsets.only(left: 30.w, right: 30.w), // Removed top margin
                  child: Image.asset(
                    'assets/Logo.png',
                  ),
                ),
                // Register to continue
                Container(
                  padding: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w),
                  child: Text(
                    'labels_register_to_continue_using_the_app'.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.fontcolor,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                // Name
                Container(
                  margin: EdgeInsets.only(top: 35.h, left: 48.w, right: 48.w),
                  child: InputTextFormField(
                    labelTextAboveTextField: Text(
                      'labels_user_name'.tr,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    suffixIcon: Icon(Icons.person, color: AppColors.fontcolor),
                    obsecure: false,
                    hintText: 'hint_text_enter_your_user_name'.tr,
                    validatorType: ValidatorType.Name,
                    textEditingController: controller.nameController,
                  ),
                ),
                // Email
                Container(
                  margin: EdgeInsets.only(top: 20.h, left: 48.w, right: 48.w),
                  child: InputTextFormField(
                    textEditingController: controller.emailController,
                    errorStyle: TextStyle(height: 0, color: Theme.of(context).colorScheme.error),
                    labelTextAboveTextField: Text(
                      'labels_email'.tr,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    suffixIcon: Icon(Icons.mail, color: AppColors.fontcolor),
                    obsecure: false,
                    hintText: 'hint_text_enter_your_email'.tr,
                    validatorType: ValidatorType.Email,
                  ),
                ),
                // Password
                Container(
                  margin: EdgeInsets.only(top: 30.h, left: 48.w, right: 48.w),
                  child: Obx(
                    () => InputTextFormField(
                      textEditingController: controller.passwordController,
                      labelTextAboveTextField: Text(
                        'labels_password'.tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      obsecure: controller.isPasswordHidden.value,
                      hintText: 'hint_text_enter_your_password'.tr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          (controller.isPasswordHidden.value)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.white,
                        ),
                        onPressed: () {
                          controller.isPasswordHidden.value =
                              !controller.isPasswordHidden.value;
                        },
                      ),
                      validatorType: ValidatorType.Password,
                    ),
                  ),
                ),
                // Password Confirmation
                Container(
                  margin: EdgeInsets.only(top: 30.h, left: 48.w, right: 48.w),
                  child: Obx(
                    () => InputTextFormField(
                      textEditingController: controller.passwordConfirmationController,
                      obsecure: controller.isPasswordHidden.value,
                      hintText: 'hint_text_enter_password_confirmation'.tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "error_please_confirm_your_password".tr;
                        }
                        if (value != controller.passwordController.text) {
                          return "error_passwords_do_not_match".tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                // Button
                Obx(
                  () => Container(
                    margin: EdgeInsets.only(top: 24.h, left: 48.w, right: 48.w),
                    child: ResponsiveButton(
                      onPressed: () {
                        if (registerFormKey.currentState!.validate()) {
                          controller.signup();
                        }
                      },
                      clickable: !controller.isLoading.value,
                      buttonStyle: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                        ),
                      ),
                      buttonWidth: Get.width,
                      child: Text(
                        'buttons_sign_up'.tr,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.fontcolor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
