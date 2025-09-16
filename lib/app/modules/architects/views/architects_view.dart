import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/data/models/arhcitect_model.dart';
import 'package:my_house_app/app/modules/architects/controllers/arhcitects_controller.dart';
import 'package:my_house_app/app/modules/architects/views/widgets/architect_card.dart';
//import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import '../../../data/services/api_endpoints.dart';

class ArchitectsView extends StatelessWidget {
  final controller = Get.put(ArchitectsController());

  ArchitectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        if (controller.isLoading.value && controller.architects.isEmpty) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.numbersfontcolor));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (!controller.isLoading.value &&
                controller.hasMore.value &&
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              controller.fetchArchitects(loadMore: true);
            }
            return false;
          },
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: GridView.builder(
              itemCount: controller.architects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14.h,
                crossAxisSpacing: 14.w,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ArchitectCard(architect: controller.architects[index]);
              },
            ),
          ),
        );
      }
      );
    
  }
}
