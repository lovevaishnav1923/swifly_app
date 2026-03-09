


import 'package:flutter/material.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/services/internet_service.dart';
import '../../core/stateManagement/provider.dart';
import '../../core/widgets/common_logger.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecase/fetch_products_use_case.dart';

class HomeViewModel extends BaseProvider {
  HomeViewModel({
    required this.fetchProductsUseCase,
    required this.internetService,
  });

  final FetchProductsUseCase fetchProductsUseCase;
  final InternetService internetService;

  /// Loading state
  bool isLoading = false;

  /// Refresh key
  final GlobalKey<RefreshIndicatorState> refreshKey =
  GlobalKey<RefreshIndicatorState>();

  /// Internet
  bool isInternetAvailable = true;

  /// Categories
  final categories = [
    {"name": AppStrings.categoryBeauty, "icon": AppImages.fashionSVG},
    {"name": AppStrings.categoryGroceries, "icon": AppImages.grocerySVG},
    {"name": AppStrings.categoryFurniture, "icon": AppImages.homeDecorSVG},
    {"name": AppStrings.categoryFragrances, "icon": AppImages.beautySVG},
  ];

  /// Index
  int currentIndex = 0;

  /// Products
  final List<ProductEntity> products = [];

  /// Filtered Products
  List<ProductEntity> categoryFilteredProducts = [];

  ///--------------------CHECK INTERNET-------------------///

  Future<void> checkInternetConnectivity() async {
    isLoading = true;
    notifyListeners();

    isInternetAvailable = await internetService.isConnected();

    await fetchProducts();
  }

  ///--------------------REFRESH-------------------///

  Future<void> refresh() async {
    await fetchProducts();
  }

  ///--------------------FETCH PRODUCTS-------------------///

  Future<void> fetchProducts() async {
    CommonLogger.info("fetchProducts() called");

    try {
      isLoading = true;
      notifyListeners();

      final result = await fetchProductsUseCase.call(isInternetAvailable);

      if (result.isSuccess) {
        products.clear();
        products.addAll(result.data ?? []);

        /// default show all
        categoryFilteredProducts = List.from(products);

        CommonLogger.success(
            "Products fetched successfully: ${products.length}");
      } else {
        CommonLogger.warning(
            "Fetch failed: ${result.failure?.message ?? "Unknown error"}");
      }
    } catch (e, s) {
      CommonLogger.error("Failed to fetch products", s, e);
    }

    isLoading = false;
    notifyListeners();
  }

  ///--------------------CHANGE CATEGORY-------------------///

  void changeCurrentIndex(int index) {
    currentIndex = index;

    final categoryName = categories[index]["name"] ?? "";

    filterProducts(categoryName);
  }

  ///--------------------FILTER PRODUCTS-------------------///

  void filterProducts(String categoryName) {
    isLoading = true;
    notifyListeners();

    categoryFilteredProducts = products
        .where((p) => p.category.toLowerCase() == categoryName.toLowerCase())
        .toList();

    isLoading = false;
    notifyListeners();
  }
}