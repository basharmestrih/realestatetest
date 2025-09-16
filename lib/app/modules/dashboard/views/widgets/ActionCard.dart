import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class ActionCard extends StatelessWidget {
  final String pagename;
  final IconData icon; // New parameter for the icon
  final VoidCallback? onTap;

  const ActionCard({
    Key? key,
    required this.pagename,
    required this.icon, // Make icon required
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondary,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.r), // Add padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40.sp, // Adjust icon size
                color: AppColors.fontcolor, // Optional: use a color from your theme
              ),
              SizedBox(height: 8.h), // Space between icon and text
              Text(
                pagename,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
