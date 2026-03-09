import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/baseView/baseView.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/di/service_locator.dart';
import 'notification_view_model.dart';

class NotificationView extends BaseView<NotificationViewModel> {
  const NotificationView({super.key});

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.notification,
          style: AppTextStyles.medium(color: theme.colorScheme.secondary),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.secondary,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: viewModel.notifications.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final item = viewModel.notifications[index];
            final Color itemColor = item['color'] as Color;

            return Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: itemColor,
                  child: Icon(item['icon'] as IconData, color: itemColor),
                ),
                title: Text(
                  item['title'] as String,
                  style: AppTextStyles.small(
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    Text(
                      item['message'] as String,
                      style: AppTextStyles.small(
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      item['time'] as String,
                      style: AppTextStyles.small(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(BuildContext context) {
    return serviceLocator.get<NotificationViewModel>();
  }
}
