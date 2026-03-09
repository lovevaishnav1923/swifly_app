import '../../models/product_model.dart';


abstract class FetchProductsRemoteDatasource {
  Future<List<ProductModel>> fetchProductsFromServer();
}