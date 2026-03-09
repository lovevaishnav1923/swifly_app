

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swifly_app/presentation/search/search_view_model.dart';

import '../../core/baseView/baseView.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/di/service_locator.dart';
import '../../core/routers/app_router.dart';
import '../../core/routers/route_names.dart';
import '../../core/widgets/common_text_field.dart';
import '../../domain/entities/product_entity.dart';
import '../home/widgets/product_card_widget.dart';

class SearchView extends BaseView<SearchViewModel> {
  final List<ProductEntity> products;

  const SearchView({super.key, required this.products});

  @override
  void onViewModelReady(SearchViewModel viewModel) {
    viewModel.setProducts(products);
  }

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: InkWell(
        onTap: (){
          viewModel.nameFocusNode.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
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
                        AppStrings.searchTitle.toUpperCase(),
                        style: AppTextStyles.small(
                          letterSpacing: 3,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Text(
                        AppStrings.searchSubText,
                        style: AppTextStyles.extraSmall(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(top: 30.h),
                child: CommonTextField(
                  suffixIcon: InkWell(
                    onTap: (){
                      viewModel.clearSearch();
                    },
                    child: SvgPicture.asset(AppImages.crossSVG,fit: BoxFit.scaleDown,),
                  ),
                  focusNode: viewModel.nameFocusNode,
                  showCursor: true,
                  readOnly: false,
                  hintText: AppStrings.searchHint,
                  controller: viewModel.searchController,
                  onChanged: (val){
                    viewModel.search(val);
                  }
                ),
              ),
              Expanded(
                child: viewModel.searchResults.isEmpty
                    ? Center(
                        child: Text(
                          AppStrings.noProducts,
                          style: AppTextStyles.medium(
                            color: theme.colorScheme.secondary
                          ),
                        ),
                      )
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: viewModel.searchResults.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w,
                          mainAxisExtent: 260.h,
                        ),
                        itemBuilder: (context, index) {
                          final product = viewModel.searchResults[index];
                          return InkWell(
                            onTap: () {
                              final selectedProduct = viewModel.searchResults
                                  .firstWhere((p) => p.id == product.id);
                              AppRouter.router.go(
                                RouteNames.productDetails,
                                extra: {'product': selectedProduct},
                              );
                            },
                            child: ProductCard(
                              discountPercentage: product.discountPercentage,
                              category: product.category,
                              title: product.title,
                              imagePath: product.image,
                              price: product.price,
                              rating: product.rating,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SearchViewModel viewModelBuilder(BuildContext context) {
    return serviceLocator.get<SearchViewModel>();
  }
}
