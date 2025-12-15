import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class OthersLocationAddressWidget extends StatelessWidget {
  final String location;
  final String address;

  const OthersLocationAddressWidget({super.key, required this.location, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size:26.sp, color: AppColors.red,),
        Text(location,
             style: Theme.of(context).textTheme.titleLarge!
             .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
        SizedBox(width:10.w),
        Text(address,
             style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize:18.r,color:AppColors.grey),),
      ],
    );
  }
}
