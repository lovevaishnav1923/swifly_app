import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../stateManagement/provider.dart';

abstract class BaseView<T extends BaseProvider> extends StatelessWidget {
  const BaseView({super.key});

  Widget builder(BuildContext context, T viewModel, Widget? child);

  void onViewModelReady(T viewModel) {}

  T viewModelBuilder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<T>.reactive(
      viewModelBuilder: () => viewModelBuilder(context),
      onViewModelReady: onViewModelReady,
      builder: builder,
    );
  }
}
