// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mirae_edge_task/core/constants/app_text_styles.dart';
//
// class AddressView extends StatelessWidget {
//   const AddressView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     final addresses = [
//       {
//         'name': 'Home',
//         'address': '123, Mirae Street, New Delhi, India',
//         'phone': '+91 9876543210',
//         'isDefault': true,
//       },
//       {
//         'name': 'Office',
//         'address': '456, Business Park, Mumbai, India',
//         'phone': '+91 9123456789',
//         'isDefault': false,
//       },
//     ];
//
//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         iconTheme: theme.iconTheme.copyWith(
//           color: theme.colorScheme.onInverseSurface,
//         ),
//
//         title: Text(
//           'Saved Addresses',
//           style: AppTextStyles.bodyBold(
//             context,
//           ).copyWith(color: theme.colorScheme.onInverseSurface),
//         ),
//         backgroundColor: theme.colorScheme.onSurface,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.w),
//         child: ListView.separated(
//           itemCount: addresses.length,
//           separatorBuilder: (_, __) => SizedBox(height: 12.h),
//           itemBuilder: (context, index) {
//             final item = addresses[index];
//             return Container(
//               padding: EdgeInsets.all(16.h),
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.surface,
//                 borderRadius: BorderRadius.circular(12.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.(0.05),
//                     blurRadius: 5,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         item['name'] as String,
//                         style: AppTextStyles.bodyBold(
//                           context,
//                         ).copyWith(color: theme.textTheme.bodyLarge?.color),
//                       ),
//                       if (item['isDefault'] == true)
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 8.w,
//                             vertical: 2.h,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.green,
//                             borderRadius: BorderRadius.circular(6.r),
//                           ),
//                           child: Text(
//                             'Default',
//                             style: AppTextStyles.small(
//                               context,
//                             ).copyWith(color: Colors.white),
//                           ),
//                         ),
//                     ],
//                   ),
//                   SizedBox(height: 6.h),
//                   Text(
//                     item['address'] as String,
//                     style: AppTextStyles.small(
//                       context,
//                     ).copyWith(color: theme.textTheme.bodyMedium?.color),
//                   ),
//                   SizedBox(height: 4.h),
//                   Text(
//                     item['phone'] as String,
//                     style: AppTextStyles.small(
//                       context,
//                     ).copyWith(color: theme.textTheme.bodyMedium?.color),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
