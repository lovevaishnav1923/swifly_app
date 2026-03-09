import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/app_text_styles.dart';

class CommonTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool showCursor;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final FocusNode? focusNode;

  const CommonTextField({
    super.key,
    this.hintText = "",
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
   required  this.readOnly,
    required this.showCursor,
    this.onTap,
     this.focusNode
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withAlpha(20),
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: Center(
        child: TextFormField(
          focusNode: widget.focusNode,
          onTap:widget.onTap ,
          readOnly: widget.readOnly,
          textAlignVertical: TextAlignVertical.center,
          cursorHeight: 18.h,

          showCursor: widget.showCursor,
          onChanged: widget.onChanged,
          style: AppTextStyles.small(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
          cursorColor: theme.colorScheme.primary,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? obscure : false,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyles.small(
              color: theme.colorScheme.secondary.withAlpha(120),
              fontWeight: FontWeight.w600,
            ),

            focusColor: AppColors.textSecondary,
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              // vertical: 22.h,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () => setState(() => obscure = !obscure),
                    child: Padding(padding: EdgeInsets.all(15.0.h)),
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 15.0.w),
                    child: widget.suffixIcon,
                  ),
            suffixIconColor: theme.colorScheme.primary,
            errorBorder: InputBorder.none,
            errorStyle: AppTextStyles.small(color: theme.colorScheme.secondary),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
