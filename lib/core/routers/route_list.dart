import 'package:go_router/go_router.dart';
import 'package:swifly_app/core/routers/route_names.dart';
import '../../domain/entities/product_entity.dart';
import '../../presentation/cart/cart_view.dart';
import '../../presentation/checkout/checkout_view.dart';
import '../../presentation/home/home_view.dart';
import '../../presentation/notifications/notification_view.dart';
import '../../presentation/product_detail/product_detail_view.dart';
import '../../presentation/profile/profile_view.dart';
import '../../presentation/search/search_view.dart';
import '../../presentation/splash/splash_view.dart';

class RouteList {

  final List<RouteBase> appRoutes = [

    /// Splash
    GoRoute(
      name: RouteNames.splash,
      path: RouteNames.splash,
      builder: (context, state) =>  SplashView(),
    ),



    ///Home
    GoRoute(
      name: RouteNames.home,
      path: RouteNames.home,
      builder: (context, state) {
        return HomeView();
      }
    ),

    /// Search
    GoRoute(
      name: RouteNames.search,
      path: RouteNames.search,
      builder: (context, state) {
        final products = state.extra as List<ProductEntity>;
        return SearchView(products: products);
      },
    ),

    /// Product Details
    GoRoute(
      name: RouteNames.productDetails,
      path: RouteNames.productDetails,
      builder: (context, state) {
        final extra = state.extra as ProductEntity;
        return ProductDetailView(productEntity: extra);
      },
    ),

    /// Cart
    GoRoute(
      name: RouteNames.cart,
      path: RouteNames.cart,
      builder: (context, state) {
        return CartView();
      },
    ),


    /// Notifications
    GoRoute(
      name: RouteNames.notifications,
      path: RouteNames.notifications,
      builder: (context, state) {
        return NotificationView();
      },
    ),

    /// Checkout
    GoRoute(
      name: RouteNames.checkout,
      path: RouteNames.checkout,
      builder: (context, state) {
        return CheckoutView();
      },
    ),

    /// Profile
    GoRoute(
      name: RouteNames.profile,
      path: RouteNames.profile,
      builder: (context, state) {
        return ProfileView();
      },
    ),

    // ///Order Success
    // GoRoute(
    //   name: RouteNames.orderSuccess,
    //   path: RouteNames.orderSuccess,
    //   builder: (context, state) {
    //     return OrderS();
    //   },
    // ),

  ];
}
