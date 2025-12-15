import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:my_house_app/app/modules/othersdetails/controllers/othersdetails_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
        final controller = Get.put(OthersdetailsController());

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title:  Text(
        'Page_title'.tr,
       style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon:  Icon(Icons.arrow_back_ios_rounded, size:30,
          color: Theme.of(context).colorScheme.error),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon:  Icon(Icons.share,  size:30,
            color:  Theme.of(context).colorScheme.error),
            onPressed: () {
            final details = '''
              ${controller.title}
              💵 السعر: ${controller.price}
              📍 الموقع: ${controller.location} - ${controller.address}

              📖 الوصف:
              ${controller.description}
              ''';
          
            Share.share(details, subject: "تفاصيل العقار");
          },
           
            
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
