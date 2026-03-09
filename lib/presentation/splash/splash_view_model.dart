

import '../../core/routers/app_router.dart';
import '../../core/routers/route_names.dart';
import '../../core/services/internet_service.dart';
import '../../core/stateManagement/provider.dart';

class SplashViewModel extends BaseProvider {
  SplashViewModel(this.internetService);

  final InternetService internetService;

  bool isInternetConnected = false;
  bool isLoading = false;

  Future<void> initializeApp() async {
    isLoading = true;
    setBusy(true);
    await Future.delayed(const Duration(seconds: 5));
    isLoading = false;
    setBusy(false);
    AppRouter.router.go(RouteNames.home);
  }
}
