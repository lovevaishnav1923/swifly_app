// import 'package:dio/dio.dart';
// import '../../presentation/base/app_exception.dart';
//
// class NetworkService {
//   late final Dio _dio;
//
//   NetworkService() {
//     _dio = Dio(BaseOptions(
//       connectTimeout: const Duration(seconds: 15),
//       receiveTimeout: const Duration(seconds: 15),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//     ));
//   }
//
//   /// GET request
//   Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) async {
//     try {
//       final response = await _dio.get(url, queryParameters: queryParameters);
//       return response;
//     } on DioException catch (e) {
//       throw NetworkException(e.message??"Something went wrong");
//     } catch (e) {
//       throw NetworkException('Unexpected error: $e');
//     }
//   }
//
//   /// POST request
//   Future<Response> post(String url, {Map<String, dynamic>? data}) async {
//     try {
//       final response = await _dio.post(url, data: data);
//       return response;
//     } on DioException catch (e) {
//       throw NetworkException(e.message??"Something went wrong");
//     } catch (e) {
//       throw NetworkException('Unexpected error: $e');
//     }
//   }
//
//   /// PUT request
//   Future<Response> put(String url, {Map<String, dynamic>? data}) async {
//     try {
//       final response = await _dio.put(url, data: data);
//       return response;
//     } on DioException catch (e) {
//       throw NetworkException(e.message??"Something went wrong");
//     } catch (e) {
//       throw NetworkException('Unexpected error: $e');
//     }
//   }
//
//   /// DELETE request
//   Future<Response> delete(String url, {Map<String, dynamic>? data}) async {
//     try {
//       final response = await _dio.delete(url, data: data);
//       return response;
//     } on DioException catch (e) {
//       throw NetworkException(e.message??"Something went wrong");
//     } catch (e) {
//       throw NetworkException('Unexpected error: $e');
//     }
//   }
// }

import 'dart:developer';
import 'package:dio/dio.dart';

import '../constants/app_urls.dart';

class DioClient {
  final Dio _dio;

  DioClient({Dio? dio})
      : _dio = dio ??
      Dio(
        BaseOptions(
          baseUrl: AppUrls.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ) {
    _setupInterceptors();
  }

  Dio get client => _dio;

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logRequest(options);
          final authHeader  = _dio.options.headers['Authorization'];
          if (authHeader != null) {
            options.headers['Authorization'] = authHeader;
          }
          handler.next(options);
        },

        onResponse: (response, handler) {
          _logResponse(response);
          handler.next(response);
        },

        onError: (err, handler) {
          _logError(err);
          handler.next(err);
        },
      ),
    );
  }

  void _logRequest(RequestOptions options) {
    log('➡️ REQUEST → [${options.method}] ${options.baseUrl}${options.path}');
    log('   headers: ${options.headers}');
    options.headers.forEach((key, value) {
      log('🔸 $key: $value');
    });
    if (options.data != null) log('   body: ${options.data}');
  }

  void _logResponse(Response response) {
    log('✅ RESPONSE ← [${response.statusCode}] ${response.requestOptions.path}');
    log('   data: ${response.data}');
  }

  void _logError(DioException err) {
    log('❌ ERROR ← ${err.requestOptions.path}');
    log('type: ${err.type}');
    log('message: ${err.message}');
    if (err.response != null) {
      log('   statusCode: ${err.response?.statusCode}');
      log('   data: ${err.response?.data}');
    }
  }

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response> put(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response> delete(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) {
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }


  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
