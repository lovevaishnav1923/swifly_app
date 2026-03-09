

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/baseView/baseView.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/di/service_locator.dart';
import '../../core/routers/route_names.dart';
import '../../core/widgets/common_button.dart';
import 'checkout_view_model.dart';

class CheckoutView extends BaseView<CheckoutViewModel> {
  const CheckoutView({super.key});

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value, {
    required ThemeData theme,
    bool isBold = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        height: 60.h,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withAlpha(20),
          borderRadius: BorderRadius.all(Radius.circular(8.r))
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: isBold
                  ? AppTextStyles.medium(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    )
                  : AppTextStyles.small(

                      color: theme.colorScheme.secondary,
                    ),
            ),
            Text(
              value,
              style: isBold
                  ? AppTextStyles.medium(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    )
                  : AppTextStyles.small(
                      color: valueColor ?? theme.colorScheme.secondary,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget builder(
    BuildContext context,
    CheckoutViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: CommonButton(
          textColor: theme.colorScheme.secondary,
          bgColor: theme.colorScheme.primary,
          title: AppStrings.confirmOrder,
          onTap: () {
            //   cartVM.clearCart();
            context.pushReplacement(RouteNames.orderSuccess);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
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
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
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
                      AppStrings.checkout.toUpperCase(),
                      style: AppTextStyles.small(
                        letterSpacing: 3,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      AppStrings.checkoutSubText,
                      style: AppTextStyles.extraSmall(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Text(
              AppStrings.shippingAddress,
              style: AppTextStyles.small(color: theme.colorScheme.secondary),
            ),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                AppStrings.userAddress,
                style: AppTextStyles.small(color: theme.colorScheme.secondary),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              AppStrings.orderSummary,
              style: AppTextStyles.small(color: theme.colorScheme.secondary),
            ),
            SizedBox(height: 15.h),
            _buildSummaryRow(
              context,
              AppStrings.subtotal,
              "\$${viewModel.subtotal}",
              theme: theme,
            ),
            _buildSummaryRow(
              context,
              AppStrings.discount,
              "-\$${viewModel.discount.toStringAsFixed(2)}",
              theme: theme,
              valueColor: Colors.green,
            ),
            _buildSummaryRow(
                context,
                AppStrings.shippingCharges,
                "\$${viewModel.shipping.toStringAsFixed(2)}",
                theme: theme),

            _buildSummaryRow(
              context,
              AppStrings.tax,
              "\$${viewModel.tax.toStringAsFixed(2)}",
              theme: theme,
            ),
            Divider(thickness: 1, color: theme.dividerColor),
            _buildSummaryRow(
              context,
              AppStrings.totalAmount,
              "\$${viewModel.total.toStringAsFixed(2)}",
              theme: theme,
              isBold: true,
              valueColor: theme.colorScheme.onSurface,
            ),

          ],
        ),
      ),
    );
  }

  @override
  CheckoutViewModel viewModelBuilder(BuildContext context) {
    return serviceLocator.get<CheckoutViewModel>();
  }
}
