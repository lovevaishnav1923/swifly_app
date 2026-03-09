import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CommonFlutterToast {
  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.success,
      textColor: AppColors.primaryColor,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.error,
      textColor: AppColors.primaryColor,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void showInfo(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.primaryColor,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
