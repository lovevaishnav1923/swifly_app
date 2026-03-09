// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mirae_edge_task/core/constants/app_text_styles.dart';
// import 'package:mirae_edge_task/domain/entities/product_entity.dart';
// import 'package:mirae_edge_task/presentation/screens/home/widgets/product_card_widget.dart';
//
// class CategoryProductsView extends StatefulWidget {
//   final String categoryName;
//   final List<Product> products;
//
//   const CategoryProductsView({
//     super.key,
//     required this.categoryName,
//     required this.products,
//   });
//
//   @override
//   State<CategoryProductsView> createState() => _CategoryProductsViewState();
// }
//
// class _CategoryProductsViewState extends State<CategoryProductsView> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         iconTheme: theme.iconTheme.copyWith(
//           color: theme.colorScheme.onInverseSurface,
//         ),
//         title: Text(
//           widget.categoryName,
//           style: AppTextStyles.bodyBold(context)
//               .copyWith(color: theme.colorScheme.onInverseSurface),
//         ),
//         centerTitle: true,
//         backgroundColor:theme.colorScheme.onSurface,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.w),
//         child: widget.products.isEmpty
//             ? Center(
//           child: Text(
//             "No products available in this category.",
//             style: AppTextStyles.body(context)
//                 .copyWith(color: theme.textTheme.bodyLarge?.color),
//           ),
//         )
//             : GridView.builder(
//           shrinkWrap: true,
//           physics: const BouncingScrollPhysics(),
//           itemCount: widget.products.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisExtent: 260.h,
//             mainAxisSpacing: 15.h,
//             crossAxisSpacing: 10.w,
//           ),
//           itemBuilder: (context, index) {
//             final product = widget.products[index];
//
//             return InkWell(
//               onTap: () {
//                 final selectedProduct = widget.products.firstWhere((p) => p.id == product.id);
//                 context.push('/productDetails', extra: {'product': selectedProduct});
//               },
//               child: ProductCard(
//                 discountPercentage: product.discountPercentage,
//                 category: product.category,
//                 title: product.title,
//                 imagePath: product.image,
//                 price: product.price,
//                 rating: product.rating,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
