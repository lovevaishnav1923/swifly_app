import 'package:dio/dio.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/widgets/common_logger.dart';
import '../../datasources/remote_data_source/fetch_products_remote_datasource.dart';
import '../../models/product_model.dart';
import '../local_data_source_impl/fetch_products_local_data_source_impl.dart';

class FetchProductsRemoteDataSourceImpl implements FetchProductsRemoteDatasource {
  final DioClient dioClient;
  final FetchProductsLocalDataSourceImpl fetchProductsLocalDataSourceImpl;


  FetchProductsRemoteDataSourceImpl(this.dioClient, this.fetchProductsLocalDataSourceImpl);

  @override
  Future<List<ProductModel>> fetchProductsFromServer() async {
    CommonLogger.info("🌐 fetchProductsFromServer() called");
    CommonLogger.info("API URL: ${AppUrls.products}");

    try {
      // 🔹 API Call Start
      CommonLogger.info("Sending GET request to server...");

      final response = await dioClient.get(AppUrls.products);

      CommonLogger.success(
        "Response received with status code: ${response.statusCode}",
      );

      // 🔹 Extracting Data
      final products = response.data['products'];
      CommonLogger.info(
        "Raw products count from API: ${products.length}",
      );

      final productsList =
      products.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();

      CommonLogger.success(
        "Products parsed successfully. Parsed count: ${productsList.length}",
      );

      // 🔹 Caching
      CommonLogger.info("Caching products locally...");
      fetchProductsLocalDataSourceImpl.cacheProducts(productsList);
      CommonLogger.success("Products cached successfully");

      return productsList;

    } on DioException catch (dioErr, stackTrace) {

      final backendMsg =
          dioErr.response?.data?['message'] ??
              dioErr.response?.data?['error'] ??
              dioErr.message ??
              AppStrings.unknownError;

      CommonLogger.error(
        "DioException occurred. StatusCode: ${dioErr.response?.statusCode}, Message: $backendMsg",
        stackTrace,
        dioErr,
      );

      switch (dioErr.response?.statusCode) {
        case 401:
          throw UnauthorizedException(
            "${AppStrings.unauthorized} :- $backendMsg",
          );

        case 400:
          throw BadRequestException(
            "${AppStrings.badRequest} :- $backendMsg",
          );

        case 500:
          throw ServerException(
            "${AppStrings.serverError} :- $backendMsg",
          );

        default:
          throw UnknownException(AppStrings.unknownError);
      }

    } catch (e, stackTrace) {

      CommonLogger.error(
        "Unexpected error in fetchProductsFromServer()",
        stackTrace,
        e,
      );

      throw UnknownException(e.toString());
    }
  }
}
