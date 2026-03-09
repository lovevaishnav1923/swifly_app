import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double price;
  final double? rating;
  final String category;
  final double discountPercentage;

  const ProductCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    this.rating,
    required this.category,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double originalPrice = (price * 100) / (100 - discountPercentage);
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withAlpha(20),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imagePath,
                height: 150.h,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  height: 150.h,
                  width: double.infinity,
                  color: theme.dividerColor,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.min ,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.small(
                      color: theme.colorScheme.secondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    category.toLowerCase(),
                    style: AppTextStyles.small(
                      color: theme.colorScheme.secondary.withAlpha(100),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    height: 30.h,
                    width: double.infinity,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₹ ${originalPrice.toStringAsFixed(2)}",
                            style: AppTextStyles.small(
                              textDecoration: TextDecoration.lineThrough,
                              decorationColor: theme.colorScheme.primary,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "₹ ${price.toStringAsFixed(2)}",
                            style: AppTextStyles.small().copyWith(
                              color: Colors.greenAccent.shade400,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
