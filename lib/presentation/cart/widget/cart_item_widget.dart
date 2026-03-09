import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withAlpha(20),
        borderRadius: BorderRadius.all(Radius.circular(12.r))
      ),
      padding: EdgeInsets.all(8.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              cartItem.image,
              height: 80.h,
              width: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.title,
                  style: AppTextStyles.small(
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  '\$${cartItem.price.toStringAsFixed(2)}',
                  style: AppTextStyles.small(
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onDecrease,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        child:  Icon(Icons.remove, color:  theme.colorScheme.onInverseSurface, size: 16.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        cartItem.quantity.toString(),
                        style: AppTextStyles.large(
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onIncrease,
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        child:  Icon(Icons.add, color: theme.colorScheme.onInverseSurface,size: 16.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(right: 15.w),
          //   child: InkWell(
          //     onTap: onRemove,
          //     child: SvgPicture.asset(
          //       AppImages.deleteSVG,
          //       color: theme.colorScheme.onSurface,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
