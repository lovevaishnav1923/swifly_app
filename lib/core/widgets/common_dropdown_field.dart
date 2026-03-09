import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CommonDropdownField extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CommonDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      barrierDismissible: true,

      initialValue: value,
      isExpanded: true,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,

        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AppTextStyles.medium(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.normal,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.textSecondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.textSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.textSecondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.error),
        ),
        errorStyle: AppTextStyles.small(color: AppColors.error),
      ),

      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: AppTextStyles.small(color: AppColors.secondaryColor),
              ),
            ),
          )
          .toList(),

      onChanged: onChanged,
    );
  }
}
