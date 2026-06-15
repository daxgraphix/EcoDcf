import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkService {
  final Dio _dio;

  NetworkService(this._dio) {
    _dio.options.baseUrl = 'https://api.ecodcf.com/v1'; // Example base URL
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    
    // Add auth interceptor here in the future
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }
}

final dioProvider = Provider<Dio>((ref) => Dio());

final networkServiceProvider = Provider<NetworkService>((ref) {
  final dio = ref.watch(dioProvider);
  return NetworkService(dio);
});
