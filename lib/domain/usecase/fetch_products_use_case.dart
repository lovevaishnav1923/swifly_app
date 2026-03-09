
import '../../core/error/result.dart';
import '../../core/widgets/common_logger.dart';
import '../entities/product_entity.dart';
import '../repo/local_repo/fetch_products_local_repo.dart';
import '../repo/remote_repo/fetch_products_remote_repo.dart';

class FetchProductsUseCase {
  final FetchProductsRemoteRepo fetchProductsRemoteRepo;
  final FetchProductsLocalRepo fetchProductsLocalRepo;

  FetchProductsUseCase(this.fetchProductsRemoteRepo, this.fetchProductsLocalRepo);

  Future<Result<List<ProductEntity>>> call(bool isInternetAvailable) async {
    CommonLogger.success("is internet available$isInternetAvailable");
    if (isInternetAvailable == false) {
      return await fetchProductsLocalRepo.fetchProductsFromLocalStorage();
    } else {
      return await fetchProductsRemoteRepo.fetchProductsFromServer();
    }
  }
}
