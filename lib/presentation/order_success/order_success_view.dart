// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:mirae_edge_task/core/constants/app_text_styles.dart';
// // import 'package:mirae_edge_task/core/widgets/common_button.dart';
// // import 'package:go_router/go_router.dart';
// //
// // class OrderSuccessView extends StatefulWidget {
// //   const OrderSuccessView({super.key});
// //
// //   @override
// //   State<OrderSuccessView> createState() => _OrderSuccessViewState();
// // }
// //
// // class _OrderSuccessViewState extends State<OrderSuccessView>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _circleScale;
// //   late Animation<double> _checkOpacity;
// //   bool showDetails = false;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 1200),
// //     );
// //
// //     _circleScale = Tween<double>(
// //       begin: 0.0,
// //       end: 1.0,
// //     ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
// //
// //     _checkOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
// //       CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)),
// //     );
// //
// //     _controller.forward();
// //
// //     Timer(const Duration(milliseconds: 1300), () {
// //       setState(() {
// //         showDetails = true;
// //       });
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //
// //     return Scaffold(
// //       backgroundColor: theme.colorScheme.background,
// //       body: Center(
// //         child: Padding(
// //           padding: EdgeInsets.all(20.w),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               ScaleTransition(
// //                 scale: _circleScale,
// //                 child: Container(
// //                   width: 130.w,
// //                   height: 130.w,
// //                   decoration: BoxDecoration(
// //                     color: theme.colorScheme.secondary.(0.15),
// //                     shape: BoxShape.circle,
// //                     border: Border.all(color: Colors.green, width: 4),
// //                   ),
// //                   child: FadeTransition(
// //                     opacity: _checkOpacity,
// //                     child: Icon(
// //                       Icons.check_rounded,
// //                       color: Colors.green,
// //                       size: 80.w,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 30.h),
// //               AnimatedOpacity(
// //                 opacity: showDetails ? 1 : 0,
// //                 duration: const Duration(milliseconds: 600),
// //                 child: Column(
// //                   children: [
// //                     Text(
// //                       "Order Placed Successfully!",
// //                       style: AppTextStyles.heading2(context).copyWith(
// //                         color: Colors.green,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     SizedBox(height: 10.h),
// //                     Text(
// //                       "Order ID: #ORD${DateTime.now().millisecondsSinceEpoch % 100000}\nEstimated Delivery: 02 Nov 2025",
// //                       style: AppTextStyles.body(context).copyWith(
// //                         color: theme.textTheme.bodyMedium?.color,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     SizedBox(height: 20.h),
// //                     Container(
// //                       padding: EdgeInsets.all(12.h),
// //                       decoration: BoxDecoration(
// //                         border: Border.all(color: theme.dividerColor),
// //                         borderRadius: BorderRadius.circular(12.r),
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           _infoRow(context, theme, "Payment Mode", "Cash on Delivery"),
// //                           _infoRow(context, theme, "Items Ordered", "3"),
// //                           _infoRow(context, theme, "Shipping To", "Delhi, India"),
// //                         ],
// //                       ),
// //                     ),
// //                     SizedBox(height: 30.h),
// //                     CommonButton(
// //                       title: "Back to Home",
// //                       onTap: () => context.go("/"),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _infoRow(BuildContext context, ThemeData theme, String title, String value) {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(vertical: 4.h),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             title,
// //             style: AppTextStyles.body(context).copyWith(
// //               color: theme.textTheme.bodyMedium?.color,
// //             ),
// //           ),
// //           Text(
// //             value,
// //             style: AppTextStyles.body(context).copyWith(
// //               fontWeight: FontWeight.bold,
// //               color: theme.textTheme.bodyMedium?.color,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/framework.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:go_router/go_router.dart';
// // import 'package:mirae_edge_task/core/baseView/baseView.dart';
// // import 'package:mirae_edge_task/core/di/service_locator.dart';
// // import 'package:mirae_edge_task/presentation/order_success/order_success_view_model.dart';
// //
// // import '../../core/constants/app_strings.dart';
// // import '../../core/constants/app_text_styles.dart';
// //
// // class OrderSuccessView extends BaseView<OrderSuccessViewModel> {
// //   const OrderSuccessView({super.key});
// //
// //   @override
// //   Widget builder(
// //     BuildContext context,
// //     OrderSuccessViewModel viewModel,
// //     Widget? child,
// //   ) {
// //     final theme = Theme.of(context);
// //     return Scaffold(
// //       body: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),child: Column(
// //         children: [
// //           SizedBox(height: 60.h),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               InkWell(
// //                 onTap: () {
// //                   context.pop();
// //                 },
// //                 child: Container(
// //                   height: 50.h,
// //                   width: 50.w,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.all(Radius.circular(5.r)),
// //                     border: Border.all(
// //                       width: 1.5,
// //                       color: theme.colorScheme.primary,
// //                     ),
// //                   ),
// //                   child: Icon(
// //                     CupertinoIcons.chevron_back,
// //                     size: 30.sp,
// //                     weight: 0.5,
// //                     color: theme.colorScheme.secondary,
// //                   ),
// //                 ),
// //               ),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 children: [
// //                   Text(
// //                     AppStrings.checkout.toUpperCase(),
// //                     style: AppTextStyles.small(
// //                       letterSpacing: 3,
// //                       color: theme.colorScheme.primary,
// //                     ),
// //                   ),
// //                   Text(
// //                     AppStrings.checkoutSubText,
// //                     style: AppTextStyles.extraSmall(
// //                       color: theme.colorScheme.secondary,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),),
// //     );
// //   }
// //
// //   @override
// //   OrderSuccessViewModel viewModelBuilder(BuildContext context) {
// //     return serviceLocator.get<OrderSuccessViewModel>();
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mirae_edge_task/core/baseView/baseView.dart';
// import 'package:mirae_edge_task/core/constants/app_text_styles.dart';
// import 'package:mirae_edge_task/core/di/service_locator.dart';
// import 'package:mirae_edge_task/core/widgets/common_button.dart';
// import 'package:mirae_edge_task/presentation/order_success/order_success_view_model.dart';
//
// class OrderSuccessView extends BaseView<OrderSuccessViewModel> with TickerProviderStateMixin {
//    OrderSuccessView({super.key});
//
//   @override
//   void onViewModelReady(OrderSuccessViewModel viewModel) {
//     viewModel.init(this);
//   }
//
//   @override
//   Widget builder(
//       BuildContext context,
//       OrderSuccessViewModel viewModel,
//       Widget? child,
//       ) {
//
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       backgroundColor: theme.colorScheme.background,
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               /// SUCCESS ANIMATION
//               ScaleTransition(
//                 scale: viewModel.circleScale,
//                 child: Container(
//                   width: 130.w,
//                   height: 130.w,
//                   decoration: BoxDecoration(
//                     color: theme.colorScheme.secondary.withOpacity(0.15),
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.green, width: 4),
//                   ),
//                   child: FadeTransition(
//                     opacity: viewModel.checkOpacity,
//                     child: Icon(
//                       Icons.check_rounded,
//                       color: Colors.green,
//                       size: 80.w,
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 30.h),
//
//               /// DETAILS
//               AnimatedOpacity(
//                 opacity: viewModel.showDetails ? 1 : 0,
//                 duration: const Duration(milliseconds: 600),
//                 child: Column(
//                   children: [
//
//                     Text(
//                       "Order Placed Successfully!",
//                       style: AppTextStyles.medium(
//                         color: Colors.green,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//
//                     SizedBox(height: 10.h),
//
//                     Text(
//                       "Order ID: ${viewModel.orderId}\nEstimated Delivery: ${viewModel.deliveryDate}",
//                       style: AppTextStyles.medium(
//                         color: theme.textTheme.bodyMedium?.color,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//
//                     SizedBox(height: 20.h),
//
//                     Container(
//                       padding: EdgeInsets.all(12.h),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: theme.dividerColor),
//                         borderRadius: BorderRadius.circular(12.r),
//                       ),
//                       child: Column(
//                         children: [
//                           _infoRow(context, theme, "Payment Mode", "Cash on Delivery"),
//                           _infoRow(context, theme, "Items Ordered", "3"),
//                           _infoRow(context, theme, "Shipping To", "Delhi, India"),
//                         ],
//                       ),
//                     ),
//
//                     SizedBox(height: 30.h),
//
//                     CommonButton(
//                       title: "Back to Home",
//                       onTap: () => context.go("/"),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _infoRow(BuildContext context, ThemeData theme, String title, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//
//           Text(
//             title,
//             style: AppTextStyles.small(
//               color: theme.textTheme.bodyMedium?.color,
//             ),
//           ),
//           Text(
//             value,
//             style: AppTextStyles.small(
//               fontWeight: FontWeight.bold,
//               color: theme.textTheme.bodyMedium?.color,
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   @override
//   OrderSuccessViewModel viewModelBuilder(BuildContext context) {
//     return serviceLocator.get<OrderSuccessViewModel>();
//   }
// }