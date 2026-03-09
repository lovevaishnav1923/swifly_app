import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swifly_app/core/routers/route_list.dart';
import '../constants/app_strings.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: RouteList().appRoutes,
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text(state.error?.toString() ?? AppStrings.somethingWentWrong),
        ),
      );
    },
  );
}
