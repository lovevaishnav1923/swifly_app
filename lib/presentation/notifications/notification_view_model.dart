import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/stateManagement/provider.dart';

class NotificationViewModel extends BaseProvider{

  final notifications = [
    {
      'title': 'Order Shipped!',
      'message': 'Your order #MIR12345 has been shipped and will arrive soon.',
      'time': '2 hours ago',
      'icon': Icons.local_shipping_rounded,
      'color': AppColors.success
    },
    {
      'title': 'New Offer 🎉',
      'message': 'Get 20% off on your next purchase. Limited time only!',
      'time': '1 day ago',
      'icon': Icons.local_offer_rounded,
      'color': Colors.blue
    },
    {
      'title': 'Payment Successful 💳',
      'message': 'Your payment of ₹1249.00 was successfully processed.',
      'time': '2 days ago',
      'icon': Icons.payment_rounded,
      'color': Colors.teal
    },
    {
      'title': 'Cart Reminder 🛒',
      'message': 'You have items waiting in your cart. Complete your order today!',
      'time': '3 days ago',
      'icon': Icons.shopping_cart_rounded,
      'color': Colors.orangeAccent
    },
  ];
}