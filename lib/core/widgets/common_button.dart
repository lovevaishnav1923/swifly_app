import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? textColor;
  final double height;
  final double borderRadius;

  const CommonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.bgColor,
    this.textColor,
    this.height = 60,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height.h,
      child: ElevatedButton(

        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.medium(
            fontWeight: FontWeight.w400,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
