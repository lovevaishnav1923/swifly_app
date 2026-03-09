import '../../../core/error/result.dart';
import '../../entities/product_entity.dart';

abstract class FetchProductsRemoteRepo {
  Future<Result<List<ProductEntity>>> fetchProductsFromServer();
}