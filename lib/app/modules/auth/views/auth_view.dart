import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/widgets/input_text_form_field.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';

import '../../../core/theme/colors.dart';
import '../../../core/util/device_utils.dart';
import '../../../data/services/validator_service.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/remember_me_checkbox.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  AuthView({super.key});
  GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
        
          // Opacity Layer
          Container(
            color: AppColors.grey.withOpacity(0.2),
          ),

          // Centered Column for Logo and Form
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h), // Adjust top padding for logo
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Image
                  Container(
                    margin: EdgeInsets.only(bottom: 2.h), // Space below logo
                    child: Image.asset(
                      'assets/Logo.png', // Replace with your logo path
                      width: 300.w, // Adjust width as needed
                      height: 300.h, // Adjust height as needed
                    ),
                  ),
                  Padding(
                     padding: EdgeInsets.symmetric(horizontal:20.w),
                     child: Column(children: [
                       // Welcome Text
                  Text(
                    'عقارات, اراضي, معامل, مصانع, مطاعم',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h), // Reduced spacing
                  Text(
                    'سورينا المنصة الاشمل لسوق العقارات في سوريا',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),

                     ],)

                  
                 
                  ),
                  SizedBox(height: 20.h), // Space before form

                  // Centered grey container for the form
                  Container(
                    width: 350.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8), // Semi-transparent grey background
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Form(
                      key: loginFormKey,
                      child: ListView(
                        shrinkWrap: true, // Prevent overflow
                        physics: NeverScrollableScrollPhysics(), // Disable scrolling
                        children: [
                          // Email
                          Container(
                            margin: EdgeInsets.only(top: 2.h),
                            child: InputTextFormField(
                              height: 90.h,
                              textEditingController: controller.emailController,
                              errorStyle: TextStyle(height: 0, color: Theme.of(context).colorScheme.error),
                              suffixIcon: Icon(Icons.mail, color: AppColors.fontcolor),
                              obsecure: false,
                              hintText: 'hint_text_enter_your_email'.tr,
                              helper: Text(''),
                              validatorType: ValidatorType.Email,
                            ),
                          ),

                          // Password
                          Container(
                            margin: EdgeInsets.only(top: 2.h),
                            child: Obx(
                              () => InputTextFormField(
                                height: 70.h,
                                textEditingController: controller.passwordController,
                                errorStyle: const TextStyle(height: -1, color: Colors.transparent),
                                obsecure: controller.isPasswordHidden.value,
                                hintText: 'hint_text_enter_your_password'.tr,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    (controller.isPasswordHidden.value)
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.primary,
                                  ),
                                  onPressed: () {
                                    controller.isPasswordHidden.value = !controller.isPasswordHidden.value;
                                  },
                                ),
                                validatorType: ValidatorType.LoginPassword,
                              ),
                            ),
                          ),

                          // Remember Me Checkbox
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(flex: 1, child: RememberMeCheckbox(isChecked: controller.rememberMe)),
                              ],
                            ),
                          ),

                          // Login Button
                          Obx(() => Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: ResponsiveButton(
                                  onPressed: () {
                                    if (loginFormKey.currentState!.validate()) {
                                      controller.login();
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
                                  child: Text('buttons_login'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.fontcolor)),
                                ),
                              )),

                          // Guest Button
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: ResponsiveButton(
                              onPressed: () {
                                Get.toNamed(Routes.HOME);
                              },
                              clickable: true,
                              buttonStyle: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                  ),
                                ),
                              ),
                              buttonWidth: Get.width,
                              child: Text('guest_button'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.fontcolor)),
                            ),
                          ),

                          // Navigate to Register
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.REGISTER),
                            child: Container(
                              margin: EdgeInsets.only(top: 15.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "labels_dont_have_an_account".tr,
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[500]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
