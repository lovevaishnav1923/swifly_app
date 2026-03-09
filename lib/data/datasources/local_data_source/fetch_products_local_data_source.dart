import 'package:hive/hive.dart';


import '../../models/product_model.dart';

class FetchProducalDataSource {
  static const String _boxName = 'productsBox';
  static const String _keyCachedProducts = 'cachedProducts';

  final Box _box = Hive.box(_boxName);

  void cacheProducts(List<ProductModel> products) {
    final list = products.map((e) => e.toJson()).toList();
    _box.put(_keyCachedProducts, list);
  }

  List<ProductModel> getCachedProducts() {
    final cached = _box.get(_keyCachedProducts, defaultValue: []);
    if (cached is List) {
      return cached
          .map((e) => ProductModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }
}


abstract class FetchProductsLocalDataSource {
  void cacheProducts(List<ProductModel> products);
  List<ProductModel> getCachedProducts();
}
