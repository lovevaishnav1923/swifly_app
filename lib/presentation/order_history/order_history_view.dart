// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mirae_edge_task/core/constants/app_text_styles.dart';
//
// class OrdersView extends StatelessWidget {
//   const OrdersView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     final orders = [
//       {
//         'orderId': 'MIR12345',
//         'date': '30 Oct 2025',
//         'status': 'Delivered',
//         'amount': 1499.00,
//       },
//       {
//         'orderId': 'MIR12346',
//         'date': '28 Oct 2025',
//         'status': 'Shipped',
//         'amount': 799.00,
//       },
//       {
//         'orderId': 'MIR12347',
//         'date': '25 Oct 2025',
//         'status': 'Cancelled',
//         'amount': 1299.00,
//       },
//     ];
//
//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         iconTheme: theme.iconTheme.copyWith(color: theme.colorScheme.onInverseSurface),
//         title: Text(
//           'My Orders',
//           style: AppTextStyles.bodyBold(context).copyWith(color: theme.colorScheme.onInverseSurface),
//         ),
//         backgroundColor:  theme.colorScheme.onSurface,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.w),
//         child: ListView.separated(
//           itemCount: orders.length,
//           separatorBuilder: (_, __) => SizedBox(height: 12.h),
//           itemBuilder: (context, index) {
//             final order = orders[index];
//             Color statusColor;
//             switch (order['status']) {
//               case 'Delivered':
//                 statusColor = Colors.greenAccent.shade400;
//                 break;
//               case 'Shipped':
//                 statusColor = Colors.orangeAccent.shade400;
//                 break;
//               case 'Cancelled':
//                 statusColor = Colors.redAccent.shade400;
//                 break;
//               default:
//                 statusColor = theme.textTheme.bodyLarge?.color ?? Colors.white;
//             }
//
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
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Order ID: ${order['orderId']}',
//                         style: AppTextStyles.bodyBold(context).copyWith(color: theme.textTheme.bodyLarge?.color),
//                       ),
//                       SizedBox(height: 4.h),
//                       Text(
//                         'Date: ${order['date']}',
//                         style: AppTextStyles.small(context).copyWith(color: theme.textTheme.bodyMedium?.color),
//                       ),
//                       SizedBox(height: 4.h),
//                       Text(
//                         'Amount: \$${order['amount'].toString()}',
//                         style: AppTextStyles.bodyBold(context).copyWith(color: theme.colorScheme.onSurface),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     order['status'].toString(),
//                     style: AppTextStyles.bodyBold(context).copyWith(
//                       color: statusColor,
//                       fontWeight: FontWeight.bold,
//                     ),
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
