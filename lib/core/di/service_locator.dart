import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../core/network/dio_client.dart';
import '../../data/datasources/local_data_source/fetch_products_local_data_source.dart';
import '../../data/datasource_impl/local_data_source_impl/fetch_products_local_data_source_impl.dart';
import '../../data/datasources/remote_data_source/fetch_products_remote_datasource.dart';
import '../../data/datasource_impl/remote_data_source_impl/fetch_products_remote_data_source_impl.dart';
import '../../domain/repo/local_repo/fetch_products_local_repo.dart';
import '../../domain/repo/remote_repo/fetch_products_remote_repo.dart';
import '../../domain/repo_impl/local_repo_impl/fetch_products_local_repo_impl.dart';
import '../../domain/repo_impl/remote_repo_impl/fetch_products_remote_repo_impl.dart';
import '../../domain/usecase/fetch_products_use_case.dart';
import '../../presentation/cart/cart_view_model.dart';
import '../../presentation/checkout/checkout_view_model.dart';
import '../../presentation/home/home_view_model.dart';
import '../../presentation/notifications/notification_view_model.dart';
import '../../presentation/product_detail/product_detail_view_model.dart';
import '../../presentation/profile/profile_view_model.dart';
import '../../presentation/search/search_view_model.dart';
import '../../presentation/splash/splash_view_model.dart';
import '../services/internet_service.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {

  /// =============================
  /// 🔹 Core / External
  /// =============================

  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<InternetService>(() => InternetService());
  serviceLocator.registerLazySingleton<DioClient>(() => DioClient());
  serviceLocator.registerLazySingleton<FetchProductsLocalDataSourceImpl>(()=> FetchProductsLocalDataSourceImpl());

  /// =============================
  /// 🔹 Data Sources
  /// =============================

  serviceLocator.registerLazySingleton<FetchProductsLocalDataSource>(() => FetchProductsLocalDataSourceImpl());

  serviceLocator.registerLazySingleton<FetchProductsRemoteDatasource>(() => FetchProductsRemoteDataSourceImpl(serviceLocator<DioClient>(), serviceLocator<FetchProductsLocalDataSourceImpl>()),
  );

  /// =============================
  /// 🔹 Repositories
  /// =============================

  serviceLocator.registerLazySingleton<FetchProductsRemoteRepo>(() => FetchProductsRemoteRepoImpl(serviceLocator<FetchProductsRemoteDatasource>()));

  serviceLocator.registerLazySingleton<FetchProductsLocalRepo>(
        () => FetchProductsLocalRepoImpl(
      serviceLocator<FetchProductsLocalDataSource>(),
    ),
  );

  /// =============================
  /// 🔹 UseCases
  /// =============================

  serviceLocator.registerLazySingleton<FetchProductsUseCase>(
        () => FetchProductsUseCase(
      serviceLocator<FetchProductsRemoteRepo>(),
      serviceLocator<FetchProductsLocalRepo>(),
    ),
  );

  /// =============================
  /// 🔹 ViewModels
  /// =============================

  serviceLocator.registerFactory<CartViewModel>(
      ()=> CartViewModel()
  );
  serviceLocator.registerFactory<HomeViewModel>(
        () => HomeViewModel(
          internetService: serviceLocator<InternetService>(),
      fetchProductsUseCase: serviceLocator<FetchProductsUseCase>(),
    ),
  );


  serviceLocator.registerFactory<SplashViewModel>(
        () => SplashViewModel(serviceLocator<InternetService>()));


  serviceLocator.registerFactory<SearchViewModel>(
        () => SearchViewModel(),
  );

  serviceLocator.registerFactory<ProductDetailViewModel>(
      ()=> ProductDetailViewModel(serviceLocator<CartViewModel>())
  );

  serviceLocator.registerFactory<NotificationViewModel>(
      () => NotificationViewModel()
  );



  serviceLocator.registerFactory<CheckoutViewModel>(
      () => CheckoutViewModel(cartViewModel :serviceLocator<CartViewModel>())
  );

  serviceLocator.registerFactory<ProfileViewModel>(
          () => ProfileViewModel()
  );


}
