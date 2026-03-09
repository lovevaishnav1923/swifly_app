import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_text_styles.dart';

class ProductListCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String category;
  final String price;

  const ProductListCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        color: theme.colorScheme.secondary.withAlpha(20),
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: theme.colorScheme.primary,
            ),
            child: Image.network(
              imagePath,
              height: 60.h,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                height: 60.h,
                width: double.infinity,
                color: theme.dividerColor,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.small(color: theme.colorScheme.secondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  category.toLowerCase(),
                  style: AppTextStyles.small(
                    color: theme.colorScheme.secondary.withAlpha(100),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          Text(
            "₹ $price",
            style: AppTextStyles.medium(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.secondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          SizedBox(width: 5.w),
        ],
      ),
    );
  }
}
