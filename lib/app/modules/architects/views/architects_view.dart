import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/architects/controllers/arhcitects_controller.dart';
import 'package:my_house_app/app/modules/architects/views/widgets/architect_card.dart';

import '../../../core/theme/colors.dart';

class ArchitectsView extends StatelessWidget {
  final controller = Get.put(ArchitectsController());

  ArchitectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value && controller.architects.isEmpty) {
        return Center(
          child: SizedBox(
            width: 95.w,
            height: 90.h,
            child:  SpinKitFadingCircle(
              color:Theme.of(context).colorScheme.error,
              size: 80.0,
            ),
          ),
        );
      }

      return RefreshIndicator(
        color: Theme.of(context).colorScheme.error,
        onRefresh: () async {
          await controller.fetchArchitects(loadMore: false);
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (!controller.isLoading.value &&
                controller.hasMore.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              controller.fetchArchitects(loadMore: true);
            }
            return false;
          },
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.architects.length +
                  (controller.hasMore.value ? 1 : 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14.h,
                crossAxisSpacing: 14.w,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                if (index < controller.architects.length) {
                  return ArchitectCard(
                    architect: controller.architects[index],
                  );
                } else {
                  // Loader at the bottom while fetching more
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      );
    });
  }
}
