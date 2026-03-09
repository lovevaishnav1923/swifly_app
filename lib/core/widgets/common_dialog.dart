import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import 'common_button.dart';

class CommonDialog {
  static Future<void> show({
    required BuildContext context,
    required String message,
    required String confirmText,
    required VoidCallback onConfirm,
    String cancelText = AppStrings.cancel,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
       //   backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 22.sp),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium(
                    fontWeight: FontWeight.normal,
                  //  color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CommonButton(
                        height: 50.h,

                      //  bgColor: AppColors.greyColor,
                        title: cancelText,
                        onTap: () {
                          Navigator.pop(context);
                          if (onCancel != null) onCancel();
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CommonButton(
                        height: 50.h,
                        title: confirmText,
                        onTap: () {
                          Navigator.pop(context);
                          onConfirm();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
