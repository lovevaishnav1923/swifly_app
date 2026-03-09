// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../core/constants/app_images.dart';
// import '../../../core/constants/app_strings.dart';
// import '../../../core/constants/app_text_styles.dart';
//
// Widget buildCategory(
//   String name,
//   String svgPath,
//   ThemeData theme,
//     bool isCurrentIndex
// ) {
//   return AnimatedContainer(
//     duration: Duration(milliseconds: 200),
//   padding: EdgeInsets.symmetric(horizontal :22.h),
//     margin: EdgeInsets.only(right: 15.w),
//     decoration: BoxDecoration(
//       border: Border.all(color: isCurrentIndex? theme.colorScheme.primary: theme.colorScheme.secondary),
//       color:  isCurrentIndex ? theme.colorScheme.primary : theme.colorScheme.surface,
//       borderRadius: BorderRadius.circular(40.r),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(svgPath, height: 25.h, width: 25.w,color: isCurrentIndex ? theme.colorScheme.primary : theme.colorScheme.secondary,),
//         SizedBox(width: 12.h),
//         Text(
//           name,
//           style: AppTextStyles.extraSmall(
//             color: isCurrentIndex ? theme.colorScheme.surface: theme.colorScheme.secondary,
//             fontWeight: FontWeight.normal,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';

Widget buildCategory(
    String name,
    String svgPath,
    ThemeData theme,
    bool isCurrentIndex,
    ) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    padding: EdgeInsets.symmetric(horizontal: 22.h),
    margin: EdgeInsets.only(right: 15.w),
    decoration: BoxDecoration(
      color: isCurrentIndex
          ? theme.colorScheme.primary
          : theme.colorScheme.secondary.withAlpha(20),
      borderRadius: BorderRadius.circular(40.r),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          height: 25.h,
          width: 25.w,
          color: isCurrentIndex
              ? theme.scaffoldBackgroundColor
              : theme.colorScheme.secondary,
        ),
        SizedBox(width: 12.h),
        Text(
          name,
          style: AppTextStyles.extraSmall(
            color: isCurrentIndex
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.secondary,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}