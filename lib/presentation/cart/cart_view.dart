
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swifly_app/presentation/cart/widget/cart_item_widget.dart';

import '../../core/baseView/baseView.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/di/service_locator.dart';
import '../../core/routers/route_names.dart';
import '../../core/widgets/common_button.dart';
import 'cart_view_model.dart';

////////////////////////////////////////////////////////////////////////////

class CartView extends BaseView<CartViewModel> {
  const CartView({super.key});

  Widget shimmerLoader(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.dividerColor,
      highlightColor: theme.dividerColor,
      child: ListView.separated(
        padding: EdgeInsets.all(16.h),
        itemCount: 5,
        separatorBuilder: (_, __) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return Container(
            height: 80.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Container(
                  height: 70.h,
                  width: 70.h,
                  margin: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 8.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14.h,
                          width: 120.w,
                          color: theme.dividerColor,
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          height: 12.h,
                          width: 80.w,
                          color: theme.dividerColor,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 14.h,
                              width: 50.w,
                              color: theme.dividerColor,
                            ),
                            Container(
                              height: 30.h,
                              width: 70.w,
                              color: theme.dividerColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPriceRow(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
    required ThemeData theme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? AppTextStyles.large(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.secondary,
                )
              : AppTextStyles.medium(color: theme.colorScheme.secondary),
        ),
        Text(
          value,
          style: isBold
              ? AppTextStyles.large(
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? theme.textTheme.bodyMedium?.color,
                )
              : AppTextStyles.small(
                  color: valueColor ?? theme.textTheme.bodySmall?.color,
                ),
        ),
      ],
    );
  }

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: viewModel.cartItems.isEmpty
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),

              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                          border: Border.all(
                            width: 1,
                            color: theme.colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        height: 60.h,

                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "₹ ${viewModel.totalPrice.toStringAsFixed(2)}",
                                style: AppTextStyles.large(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              Text(
                                AppStrings.totalAmount,
                                style: AppTextStyles.extraSmall(
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: CommonButton(
                        bgColor: theme.colorScheme.primary,
                        title: AppStrings.checkout,
                        onTap: () {
                          context.push(RouteNames.checkout);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
      body: viewModel.isLoading
          ? shimmerLoader(context)
          : Column(
              children: [
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.r),
                            ),
                            border: Border.all(
                              width: 1.5,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          child: Icon(
                            CupertinoIcons.chevron_back,
                            size: 30.sp,
                            weight: 0.5,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.cart.toUpperCase(),
                            style: AppTextStyles.small(
                              letterSpacing: 3,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Text(
                            AppStrings.cartSubText,
                            style: AppTextStyles.extraSmall(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                viewModel.cartItems.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            AppStrings.emptyCart,
                            style: AppTextStyles.medium(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.separated(
                          itemCount: viewModel.cartItems.length,
                          separatorBuilder: (_, __) =>
                              Divider(color: theme.dividerColor),
                          itemBuilder: (context, index) {
                            final item = viewModel.cartItems[index];
                            return CartItemWidget(
                              cartItem: item,
                              onIncrease: () =>
                                  viewModel.increaseQuantity(item.id),
                              onDecrease: () =>
                                  viewModel.decreaseQuantity(item.id),
                              onRemove: () => viewModel.removeFromCart(item.id),
                            );
                          },
                        ),
                      ),
              ],
            ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) {
    return serviceLocator.get<CartViewModel>();
  }
}
