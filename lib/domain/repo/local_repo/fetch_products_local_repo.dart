import '../../../core/error/result.dart';
import '../../entities/product_entity.dart';

abstract class FetchProductsLocalRepo {
  Future<Result<List<ProductEntity>>> fetchProductsFromLocalStorage();
}