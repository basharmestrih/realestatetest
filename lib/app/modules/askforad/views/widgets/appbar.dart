import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';

class DetailedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title:  Text(
        'askforsell_title'.tr,
       style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon:  Icon(Icons.arrow_back_ios_sharp, size:30,color:Theme.of(context).colorScheme.error),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
     
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
