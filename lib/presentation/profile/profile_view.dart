

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:swifly_app/presentation/profile/profile_view_model.dart';


import '../../core/baseView/baseView.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/di/service_locator.dart';
import '../../core/routers/route_names.dart';
import '../../core/theme/theme_provider.dart';

class ProfileView extends BaseView<ProfileViewModel> {
  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: theme.primaryColor,
            backgroundImage: AssetImage(AppImages.manImage),
          ),
          SizedBox(height: 10.h),
          Text(
            AppStrings.userName,
            style: AppTextStyles.medium(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            AppStrings.userEmail,
            style: AppTextStyles.small(color: theme.colorScheme.secondary),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required String icon,
    required String title,
    VoidCallback? onTap,
    required String subtitle,
    Widget? trailing,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          color: theme.colorScheme.secondary.withAlpha(20),
        ),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: theme.colorScheme.primary,
              ),
              child: SvgPicture.asset(
                icon,

                fit: BoxFit.scaleDown,

                errorBuilder: (_, __, ___) => Container(
                  height: 20.h,
                  width: double.infinity,
                  color: theme.dividerColor,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.small(
                      color: theme.colorScheme.secondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyles.small(
                      color: theme.colorScheme.secondary.withAlpha(100),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

     trailing ??    Icon(
              CupertinoIcons.chevron_forward,
              color: theme.colorScheme.secondary,
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }

  void _showSnack(BuildContext context) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: theme.colorScheme.onSurface,
        content: Text(
          AppStrings.comingSoon,
          style: AppTextStyles.small().copyWith(
            color: theme.colorScheme.onInverseSurface,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
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
                        AppStrings.profile.toUpperCase(),
                        style: AppTextStyles.small(
                          letterSpacing: 3,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Text(
                        AppStrings.profileSubText,
                        style: AppTextStyles.extraSmall(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              _buildProfileHeader(context),
              SizedBox(height: 40.h),
        
              _buildSettingsTile(
                context,
                icon: AppImages.editSVG,
                title: AppStrings.editProfile,
                subtitle: AppStrings.editProfileSubText,
                onTap: () => _showSnack(context),
              ),
              _buildSettingsTile(
                context,
                icon: AppImages.ordersSvg,
                title: AppStrings.orders,
                subtitle: AppStrings.ordersSubText,
                onTap: () => context.pushNamed('/orders'),
              ),
              _buildSettingsTile(
                context,
                icon: AppImages.cartSVG,
                title: AppStrings.cart,
                subtitle: AppStrings.cartSubText,
                onTap: () => context.pushNamed(RouteNames.cart),
              ),
              _buildSettingsTile(
                context,
                icon: AppImages.addressSVG,
                title: AppStrings.address,
                subtitle: AppStrings.addressSubText,
                onTap: () => context.pushNamed('/addresses'),
              ),
              _buildSettingsTile(
                context,
                icon: AppImages.notificationSVG,
                title: AppStrings.notification,
                subtitle: AppStrings.notificationSubText,
                onTap: () => context.pushNamed('/notifications'),
              ),
              _buildSettingsTile(
                context,
                icon: AppImages.darkModeSVG,
                title: AppStrings.darkMode,
                subtitle: AppStrings.darkMode,
                trailing: Switch(
                  activeThumbColor: theme.colorScheme.primary,
                  inactiveThumbColor: theme.colorScheme.secondary,
                  value:false,
                  inactiveTrackColor: theme.scaffoldBackgroundColor,
                  onChanged: (value) => ThemeProvider().toggleTheme(value),
                ),
              ),
              _buildSettingsTile(
                context,
                icon: AppImages.logoutSVG,
                title: AppStrings.logout,
                subtitle: AppStrings.logoutSubText,
                onTap: () => _showSnack(context),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) {
    return serviceLocator.get<ProfileViewModel>();
  }
}
