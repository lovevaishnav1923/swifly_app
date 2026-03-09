import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifly_app/presentation/splash/splash_view_model.dart';


import '../../core/baseView/baseView.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/di/service_locator.dart';

class SplashView extends BaseView<SplashViewModel> {
  const SplashView({super.key});

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    viewModel.initializeApp();
  }

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: SizedBox(
          height: 300.h,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            child: Image.asset(AppImages.logo, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) {
    return serviceLocator.get<SplashViewModel>();
  }
}
