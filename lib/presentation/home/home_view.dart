import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/baseView/baseView.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/di/service_locator.dart';
import '../../core/routers/route_names.dart';
import '../../core/widgets/common_text_field.dart';
import 'home_view_model.dart';
import 'widgets/product_card_widget.dart';
import 'widgets/product_category_widget.dart';
import 'widgets/product_list_card_widget.dart';

class HomeView extends BaseView<HomeViewModel> {
  const HomeView({super.key});

  @override
  void onViewModelReady(HomeViewModel viewModel) async{
    await viewModel.checkInternetConnectivity();
    viewModel.filterProducts(viewModel.categories[0]["name"]??"");
  }

  /// header shimmer
  Widget headerShimmer(ThemeData theme) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.primary.withAlpha(60),
      highlightColor: theme.colorScheme.primary.withAlpha(60),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                height: 10.h,
                color: theme.colorScheme.primary,
              ),
              SizedBox(height: 6.h),
              Container(
                width: 120.w,
                height: 10.h,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(radius: 20.r),
        ],
      ),
    );
  }

  /// search bar shimmer
  Widget searchShimmer(ThemeData theme) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.primary.withAlpha(60),
      highlightColor: theme.colorScheme.primary.withAlpha(60),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  /// category shimmer
  Widget categoryShimmer(ThemeData theme) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.primary.withAlpha(60),
      highlightColor: theme.colorScheme.primary.withAlpha(60),
      child: SizedBox(
        height: 50.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: 120.w,
              padding: EdgeInsets.symmetric(horizontal: 22.h),
              margin: EdgeInsets.only(right: 15.w),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(40.r),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Shimmer Card
  Widget shimmerCard(ThemeData theme) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.primary.withAlpha(60),
      highlightColor: theme.colorScheme.primary.withAlpha(60),
      child: Container(
        width: 250.w,
        margin: EdgeInsets.only(right: 25.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }

  /// products heading shimmer
  Widget productsHeadingShimmer(ThemeData theme) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.primary.withAlpha(60),
      highlightColor: theme.colorScheme.primary.withAlpha(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80.w,
            height: 10.h,
            color: theme.colorScheme.primary,
          ),
          SizedBox(height: 6.h),
          Container(
            width: 120.w,
            height: 10.h,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }

  /// Shimmer List Tile
  Widget shimmerListTile(ThemeData theme) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.primary.withAlpha(60),
      highlightColor: theme.colorScheme.primary.withAlpha(60),
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        height: 80.h,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: RefreshIndicator(
        onRefresh: viewModel.refresh,
        color: theme.colorScheme.primary,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),

              /// Header
              viewModel.isLoading
                  ? headerShimmer(theme)
                  : Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.titleText,
                              style: AppTextStyles.small(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              AppStrings.hiUser,
                              style: AppTextStyles.large(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context.push(RouteNames.profile);
                          },
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundImage: AssetImage(AppImages.manImage),
                          ),
                        ),
                      ],
                    ),

              SizedBox(height: 30.h),

              /// Search
              viewModel.isLoading
                  ? searchShimmer(theme)
                  : CommonTextField(
                      onTap: () {
                        context.push(
                          RouteNames.search,
                          extra: viewModel.products,
                        );
                      },
                      showCursor: false,
                      readOnly: true,
                      hintText: AppStrings.searchHint,
                      suffixIcon: SvgPicture.asset(
                        AppImages.searchSVG,
                        fit: BoxFit.scaleDown,
                        color: theme.colorScheme.secondary,
                      ),
                    ),

              SizedBox(height: 30.h),

              /// Categories
              viewModel.isLoading
                  ? categoryShimmer(theme)
                  : SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              viewModel.changeCurrentIndex(index);
                            },
                            child: buildCategory(
                              viewModel.categories[index]["name"] ?? "",
                              viewModel.categories[index]["icon"] ?? "",
                              theme,
                              viewModel.currentIndex == index,
                            ),
                          );
                        },
                      ),
                    ),

              SizedBox(height: 30.h),

              /// Horizontal Products
              viewModel.isLoading
                  ? SizedBox(
                      height: 350.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (_, __) => shimmerCard(theme),
                      ),
                    )
                  : SizedBox(
                      height: 350.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.categoryFilteredProducts.length,
                        itemBuilder: (context, index) {
                          final product =
                              viewModel.categoryFilteredProducts[index];
                          return InkWell(
                            onTap: () {
                              context.push(
                                RouteNames.productDetails,
                                extra: product,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 25.w),
                              width: 250.w,
                              child: ProductCard(
                                discountPercentage: product.discountPercentage,
                                category: product.category,
                                title: product.title,
                                imagePath: product.image,
                                price: product.price,
                                rating: product.rating,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

              SizedBox(height: 30.h),

              /// Title
              viewModel.isLoading
                  ? productsHeadingShimmer(theme)
                  : Align(
                alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.ourProducts,
                      style: AppTextStyles.medium(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),

              SizedBox(height: 20.h),

              /// Product List
              viewModel.isLoading
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (_, __) => shimmerListTile(theme),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.products.length,
                      itemBuilder: (context, index) {
                        final product = viewModel.products[index];
                        return InkWell(
                          onTap: (){
                            context.push(
                              RouteNames.productDetails,
                              extra: product,
                            );
                          },
                          child: ProductListCardWidget(

                            imagePath: product.image,
                            title: product.title,
                            category: product.category,
                            price: product.price.toString(),
                          ),
                        );
                      },
                    ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return serviceLocator.get<HomeViewModel>();
  }
}
