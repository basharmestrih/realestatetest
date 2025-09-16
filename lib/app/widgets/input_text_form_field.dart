import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/theme/colors.dart';
import '../data/services/validator_service.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final ValidatorType? validatorType;
  final InputDecoration? decoration;
  final double? width; // Width of the field
  final double? height; // Height of the field
  final EdgeInsetsGeometry? margin; // Margin around the field
  final EdgeInsetsGeometry? padding; // Padding inside the field
  final bool obsecure;
  final String? hintText; // Hint text
  final Widget? labelTextAboveTextField; // Nullable label
  final Widget? prefixIcon; // Prefix icon
  final Widget? suffixIcon; // Suffix icon
  final Widget? icon; // Custom leading icon
  final Widget? helper;
  final TextStyle? errorStyle;
  final String? otherValueForValidation;
  final Widget? counter;
  final String? Function(String?)? validator;
  InputTextFormField({
    super.key,
    this.textEditingController,
    this.validatorType,
    this.decoration,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
    this.errorStyle,
    this.otherValueForValidation,
    this.validator,
    required this.obsecure,   this.labelTextAboveTextField, this.counter, this.helper,

  });

  final ValidationController validationController = Get.put(ValidationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Responsive width
      height: height, // Responsive height
      margin: margin , // Responsive margin
      //padding: padding,  // Responsive padding
      child: TextFormField(
        style: TextStyle(color: AppColors.fontcolor, fontSize: 15.sp,),

        
        
       
        controller: textEditingController,
        obscureText: obsecure,
        keyboardType: validatorType == ValidatorType.PhoneNumber ||
            validatorType == ValidatorType.Number
            ? TextInputType.number
            : TextInputType.text,



        decoration: decoration ??

       InputDecoration(
        
  errorStyle: errorStyle,
  filled: true,
  icon: icon,
  fillColor: Colors.transparent.withOpacity(0.2),

  helper: helper,
  counter: counter,

  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: BorderSide(
      color: const Color.fromARGB(255, 164, 163, 163),
      width: 1.5,
    ),
  ),

  labelStyle: TextStyle(
    color: Theme.of(context).colorScheme.primary,
    fontSize: 14.r,
  ),
   hintText: hintText,
  hintStyle: TextStyle(
    color: Colors.grey[50],
    fontSize: 14.r,
  ),
  contentPadding: EdgeInsets.only(left: 10.w,right:10.w, bottom:3.h), // remove default padding so hint is exactly centered
  
  // Align hint and input text to center
  alignLabelWithHint: true,
  prefixIcon: prefixIcon,
  suffixIcon: suffixIcon,
),
textAlign: TextAlign.start,            // center the text and the hint text horizontally
textAlignVertical: TextAlignVertical.center,


        validator: validator??(value) {
          switch (validatorType) {
            case ValidatorType.Name:
              return validationController.validateName(value!);
            case ValidatorType.Email:
              return validationController.validateEmail(value!);
            case ValidatorType.Password:
              return validationController.validatePassword(value!);
            case ValidatorType.LoginPassword:
              return validationController.validateLoginPassword(value!);
            case ValidatorType.PhoneNumber:
              return validationController.validatePhoneNumber(value!);
            case ValidatorType.Number:
              return validationController.validateNumber(value!);
            case ValidatorType.Code:
              return validationController.validateResetCode(value!);

            default:
              return validationController.validateDefault(value!);
          }
        },
      ),
    );
  
  
  }
}

//For a label above the text field but but in in a column with start as a crossAxisAlignment
          