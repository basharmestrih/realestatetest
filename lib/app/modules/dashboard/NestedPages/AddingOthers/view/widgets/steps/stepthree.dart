import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/OthersmanagerController.dart';
import 'package:my_house_app/generated/locales.g.dart';

class StepThree extends StatefulWidget {
  final OthersManagerController controller;
  const StepThree({required this.controller, super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  late bool forSell;
  late bool forRent;
  late bool showOnTimeline;
  late String? selectedCategory;

  @override
  void initState() {
    super.initState();
    forSell = widget.controller.forSell;
    forRent = widget.controller.forRent;
    showOnTimeline = widget.controller.showOnTimeline.value;
    selectedCategory = widget.controller.selectedCategory.value;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return _buildCardSection(context, children: [
      // Media Section
      Text(
        LocaleKeys.Media_title.tr,
        style: theme.textTheme.titleLarge?.copyWith(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 12.h),

      /// Images
      Row(
        children: [
          Icon(Icons.image, color: colorScheme.onPrimaryContainer),
          SizedBox(width: 8.w),
          ElevatedButton(
            onPressed: widget.controller.pickImages,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.secondary,
            ),
            child: Text(LocaleKeys.images_button.tr),
          ),
          SizedBox(width: 12.w),
          Text(
            "${widget.controller.selectedImages.length} selected",
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
      SizedBox(height: 16.h),

      /// Video
      Row(
        children: [
          Icon(Icons.video_collection, color: colorScheme.onPrimaryContainer),
          SizedBox(width: 8.w),
          ElevatedButton(
            onPressed: widget.controller.pickVideo,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.secondary,
            ),
            child: Text(LocaleKeys.videos_button.tr),
          ),
          SizedBox(width: 12.w),
          Text(
            widget.controller.selectedVideo != null
                ? "Video selected"
                : "No video",
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
      SizedBox(height: 12.h),

      /// Offer type
      Text(
        LocaleKeys.offer_type.tr,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimaryContainer,
        ),
      ),
      Row(
        children: [
          Checkbox(
            value: forSell,
            onChanged: (value) {
              setState(() => forSell = value ?? false);
              widget.controller.setForSell(value ?? false);
            },
            activeColor: colorScheme.secondary,
          ),
          Expanded(
            child: Text(
              LocaleKeys.for_sale_category.tr,
              style: TextStyle(color: colorScheme.onPrimaryContainer),
            ),
          ),
          Checkbox(
            value: forRent,
            onChanged: (value) {
              setState(() => forRent = value ?? false);
              widget.controller.setForRent(value ?? false);
            },
            activeColor: colorScheme.secondary,
          ),
          Expanded(
            child: Text(
              LocaleKeys.for_rent_category.tr,
              style: TextStyle(color: colorScheme.onPrimaryContainer),
            ),
          ),
        ],
      ),
      SizedBox(height: 12.h),

      /// Timeline
      Text(
        LocaleKeys.timeline_title_title.tr,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimaryContainer,
        ),
      ),
      Row(
        children: [
          Checkbox(
            value: showOnTimeline,
            onChanged: (value) {
              setState(() => showOnTimeline = value ?? false);
              widget.controller.setShowOnTimeline(value ?? false);
            },
            activeColor: colorScheme.secondary,
          ),
          Text(
            LocaleKeys.timeline_title_label.tr,
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
      SizedBox(height: 12.h),

      /// Category
      Text(
        LocaleKeys.category_hint.tr,
        style: theme.textTheme.titleLarge?.copyWith(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          Checkbox(
            value: selectedCategory == 'Shop',
            onChanged: (v) {
              setState(() => selectedCategory = v == true ? 'Shop' : null);
              widget.controller.setSelectedCategory(v == true ? 'Shop' : null);
            },
            activeColor: colorScheme.secondary,
          ),
          Text(
            LocaleKeys.shop_option.tr,
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
      Row(
        children: [
          Checkbox(
            value: selectedCategory == 'Land',
            onChanged: (v) {
              setState(() => selectedCategory = v == true ? 'Land' : null);
              widget.controller.setSelectedCategory(v == true ? 'Land' : null);
            },
            activeColor: colorScheme.secondary,
          ),
          Text(
            LocaleKeys.land_option.tr,
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
    ]);
  }

  Widget _buildCardSection(BuildContext context,
      {required List<Widget> children}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
            .expand((w) => [w, SizedBox(height: 8.h)])
            .toList()
          ..removeLast(),
      ),
    );
  }
}
