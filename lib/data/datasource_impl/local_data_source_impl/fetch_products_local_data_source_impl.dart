import 'package:hive/hive.dart';
import '../../datasources/local_data_source/fetch_products_local_data_source.dart';
import '../../models/product_model.dart';

class FetchProductsLocalDataSourceImpl implements FetchProductsLocalDataSource{


  final Box _box = Hive.box('productsBox');

  @override
  void cacheProducts(List<ProductModel> products) {
    final list = products.map((e) => e.toJson()).toList();
    _box.put('cachedProducts', list);
  }

  @override
  List<ProductModel> getCachedProducts() {
    final cached = _box.get('cachedProducts', defaultValue: []);
    if (cached is List) {
      return cached
          .map((e) => ProductModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }
}