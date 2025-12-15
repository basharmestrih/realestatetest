import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isMultiline;
  final double? height; // new optional param for custom height

  const InputField(
    this.label,
    this.hint,
    this.controller, {
    this.isMultiline = false,
    this.height,
    super.key,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _isEmpty = widget.controller.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(height: 6.h),
          SizedBox(
            height: widget.height ?? (widget.isMultiline ? 160.h : 48.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextFormField(
                  controller: widget.controller,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 14.sp,
                  ),
                  maxLines: widget.isMultiline ? null : 1,
                  expands: widget.isMultiline,
                  textAlign: _isEmpty && widget.isMultiline
                      ? TextAlign.center
                      : TextAlign.start,
                  textAlignVertical: widget.isMultiline
                      ? TextAlignVertical.top
                      : TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText:
                        !_isEmpty || !widget.isMultiline ? widget.hint : '',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14.sp,
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                    // contentPadding stays the same always
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  ),
                ),
                if (widget.isMultiline && _isEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.grey.shade500, size: 28.sp),
                      SizedBox(height: 8.h),
                      Text(
                        widget.hint,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
