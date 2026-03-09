import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swifly_app/presentation/product_detail/product_detail_view_model.dart';

import '../../core/baseView/baseView.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/di/service_locator.dart';
import '../../core/routers/route_names.dart';
import '../../core/widgets/common_button.dart';
import '../../core/widgets/common_logger.dart';
import '../../data/models/cart_item.dart';
import '../../domain/entities/product_entity.dart';

class ProductDetailView extends BaseView<ProductDetailViewModel> {
  final ProductEntity productEntity;

  const ProductDetailView({super.key, required this.productEntity});

  @override
  void onViewModelReady(ProductDetailViewModel viewModel) {
    viewModel.isProductInCart(productEntity.id);
  }

  Widget reviewTab(BuildContext context) {
    final theme = Theme.of(context);
    final int randomRating = Random().nextInt(6);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withAlpha(15),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: theme.colorScheme.secondary,
                child: Image.asset(AppImages.customerImage),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                AppStrings.customerName,
                  style: AppTextStyles.medium(
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  randomRating,
                  (index) => Icon(Icons.star, size: 16.sp, color: Colors.amber),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            AppStrings.customerReviews,
            style: AppTextStyles.small(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  @override
  Widget builder(
    BuildContext context,
    ProductDetailViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
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
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      productEntity.category.toUpperCase(),
                      style: AppTextStyles.small(
                        letterSpacing: 3,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      AppStrings.viewCategory,
                      style: AppTextStyles.extraSmall(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Image.network(
                productEntity.image,
                height: 350.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 350.h,
                  width: double.infinity,
                  color: theme.dividerColor,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productEntity.title,
                      style: AppTextStyles.large(
                        fontWeight: FontWeight.normal,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    Text(
                      productEntity.category,
                      style: AppTextStyles.small(
                        fontWeight: FontWeight.normal,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Icon(CupertinoIcons.heart, color: theme.colorScheme.secondary),
              ],
            ),
            SizedBox(height: 30.h),
            Column(
              children: [
                SizedBox(
                  height: 40.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.tabs.length,
                    itemBuilder: (context, index) {
                      final isSelected = viewModel.currentTabIndex == index;
                      return InkWell(
                        onTap: () {
                          viewModel.changeTab(index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          margin: EdgeInsets.symmetric(horizontal: 25.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.secondary.withAlpha(20),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            viewModel.tabs[index],
                            style: AppTextStyles.small(
                              color: isSelected
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.secondary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200.h,
                  child: PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: viewModel.pageController,
                    onPageChanged: viewModel.onPageChanged,
                    itemCount: viewModel.tabs.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              maxLines: viewModel.isExpanded ? null : 3,
                              overflow: viewModel.isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                              AppStrings.productDescription,
                              style: AppTextStyles.small(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                viewModel.changeTextVisibility();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Text(
                                  viewModel.isExpanded
                                      ? AppStrings.seeLess
                                      : AppStrings.seeMore,
                                  style: AppTextStyles.small(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      if (index == 1) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return reviewTab(context);
                          },
                        );
                      }


                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){

                },
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    border: Border.all(
                      width: 1,
                      color: theme.colorScheme.secondary
                    )
                  ),

                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹ ${productEntity.price.toString()}",
                          style: AppTextStyles.large(color: theme.colorScheme.primary),
                        ),
                        Text(
                          AppStrings.exclusiveOfGST,
                          style: AppTextStyles.extraSmall(color: theme.colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),

            SizedBox(width: 15.w,),
            Expanded(
              child: CommonButton(
                bgColor: theme.colorScheme.secondary,
                title: viewModel.productAlreadyInCart
                    ? AppStrings.goToCart
                    : AppStrings.addToCart,
                onTap: () {
                  CommonLogger.info("tapped the add to cart button");
                  if (viewModel.productAlreadyInCart) {
                    context.push(RouteNames.cart);
                  } else {
                    final cartItem = CartItem(
                      id: productEntity.id,
                      title: productEntity.title,
                      price: productEntity.price,
                      quantity: 1,
                      image: productEntity.image,
                    );
                    viewModel.addToCart(cartItem);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: theme.colorScheme.onSurface,
                        content: Text(
                          "${productEntity.title}${ AppStrings.addedToCart}",
                          style: AppTextStyles.small(),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProductDetailViewModel viewModelBuilder(BuildContext context) {
    return serviceLocator.get<ProductDetailViewModel>();
  }
}
