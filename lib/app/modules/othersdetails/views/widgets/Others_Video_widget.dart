/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/video_Bottom_Sheet_widget.dart';

class PropertyVideo extends StatefulWidget {
  const PropertyVideo({super.key});

  @override
  State<PropertyVideo> createState() => _PropertyVideoState();
}

class _PropertyVideoState extends State<PropertyVideo> {
  bool _isHovered = false;

  void _openVideoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (_) => const VlcVideoPlayerWidget(
        videoUrl: 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _openVideoBottomSheet(context),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.8)
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.play_arrow, color: Colors.black, size: 20.sp),
              SizedBox(width: 6.w),
              Text(
                'Watch Trailer',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
