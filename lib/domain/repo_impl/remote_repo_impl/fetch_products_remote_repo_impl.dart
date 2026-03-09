import '../../../core/constants/app_strings.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/result.dart';
import '../../../data/datasources/remote_data_source/fetch_products_remote_datasource.dart';
import '../../../domain/entities/product_entity.dart';
import '../../repo/remote_repo/fetch_products_remote_repo.dart';

class FetchProductsRemoteRepoImpl implements FetchProductsRemoteRepo{
  final FetchProductsRemoteDatasource fetchProductsRemoteDatasource;

  FetchProductsRemoteRepoImpl(this.fetchProductsRemoteDatasource);

  @override
  Future<Result<List<ProductEntity>>> fetchProductsFromServer() async{
    try{
      final response = await fetchProductsRemoteDatasource.fetchProductsFromServer();
      final entities = response.map((model) => model.toEntity()).toList();
      return Result.success(entities);
    }catch(e){
      return Result.error(
        Failure(
        title: AppStrings.error,
        message: e.toString().isEmpty
            ? AppStrings.unknownError
            : e.toString(),
      ));
    }
  }

}