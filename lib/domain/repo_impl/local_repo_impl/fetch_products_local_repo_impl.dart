
import '../../../core/constants/app_strings.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/result.dart';
import '../../../data/datasources/local_data_source/fetch_products_local_data_source.dart';
import '../../entities/product_entity.dart';
import '../../repo/local_repo/fetch_products_local_repo.dart';

class FetchProductsLocalRepoImpl implements FetchProductsLocalRepo{
  final FetchProductsLocalDataSource fetchProductsLocalDataSource;

  FetchProductsLocalRepoImpl(this.fetchProductsLocalDataSource);

  @override
  Future<Result<List<ProductEntity>>> fetchProductsFromLocalStorage() async {
    try {
      final response = fetchProductsLocalDataSource.getCachedProducts();
      final entities = response.map((model) => model.toEntity()).toList();
      return Result.success(entities);
    } catch (e) {
      return Result.error(
        Failure(
          title: AppStrings.error,
          message: e.toString().isEmpty
              ? AppStrings.unknownError
              : e.toString(),
        ),
      );
    }
  }
}
