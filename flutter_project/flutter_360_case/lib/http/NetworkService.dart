import 'package:dio/dio.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  final Dio _dio = Dio();
  final String _host = 'https://mock.apifox.com';

  factory NetworkService() {
    return _instance;
  }

  NetworkService._internal();

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        '$_host/$path',
        queryParameters: queryParameters,
      );
      return response;
    } catch (error, stacktrace) {
      throw Exception("获取数据失败");
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    print('--------------： $_host/$path');
    try {
      final response = await _dio.post(
        '$_host/$path',
        data: data,
      );
      return response;
    } catch (error, stacktrace) {
      throw Exception("获取数据失败");
    }
  }
}
