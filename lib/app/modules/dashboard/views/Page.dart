import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/controller/DashBoardController.dart';
import 'package:my_house_app/app/modules/dashboard/views/widgets/ActionCard.dart';
import 'package:my_house_app/app/modules/dashboard/views/widgets/Appbar.dart';

class DashBoardPage extends GetView<DashBoardController> {
  const DashBoardPage({Key? key}) : super(key: key);

  static List<Map<String, dynamic>> get pageDetails {
    // Create a list of maps to hold page names and their corresponding icons
    return Get.locale?.languageCode == 'ar'
        ? [
            {'name': 'إضافة منزل', 'icon': Icons.add_home},
            {'name': 'حذف منزل', 'icon': Icons.delete},
            {'name': 'إضافة مهندس', 'icon': Icons.engineering},
            {'name': 'حذف مهندس', 'icon': Icons.delete_sweep_outlined},

            {'name': 'إضافة محل/أرض', 'icon': Icons.store},
            {'name': 'حذف محل/أرض', 'icon': Icons.delete_forever},
          ]
        : [
            {'name': 'Add Property', 'icon': Icons.add_home},
            {'name': 'Delete Property', 'icon': Icons.delete},
            {'name': 'Show Properties', 'icon': Icons.visibility},
            {'name': 'Add Engineer', 'icon': Icons.engineering},
            {'name': 'Delete Engineer', 'icon': Icons.delete_sweep_outlined},
            {'name': 'Add Shop/Land', 'icon': Icons.store},
            {'name': 'Delete Shop/Land', 'icon': Icons.delete_forever},
          ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      backgroundColor:  Theme.of(context).colorScheme.primary,
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(right:5.w,left:5.w,top:20.h),
        child: GridView.builder(
          itemCount: pageDetails.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            mainAxisSpacing: 48.h,
            crossAxisSpacing: 8.h,
            childAspectRatio: 0.75.h,
          ),
          itemBuilder: (context, index) {
           final pageDetail = pageDetails[index];
            return ActionCard(
              pagename: pageDetail['name'],
              icon: pageDetail['icon'], // Pass the icon to ActionCard
              onTap: () => controller.onCardTap(index),
            );
          },
        ),
      ),
    );
  }
}
