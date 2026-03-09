import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CommonLoader extends StatelessWidget {
  final double size;
  final Color? color;

  const CommonLoader({
    super.key,
    this.size = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
