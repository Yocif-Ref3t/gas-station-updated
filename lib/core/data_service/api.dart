import 'package:dio/dio.dart';
import 'package:gas_station_app/core/data_service/local_data/local_data.dart';

class ApiService {
  Dio mydio = Dio();

  ApiService() {
    mydio = Dio(BaseOptions(
      baseUrl: "https://demo.infosasw.com/api/v1",
      headers: {
        "Accept": "application/json",
        'Content-Type': "application/json",
        "Authorization": 'Bearer ${getToken()}',
      },
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ))
      ..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getToken()}',
    };
    try {
      final response =
          await mydio.get(url, queryParameters: queryParameters, data: body);
      return response;
    } on DioException catch (ex) {
      throw Exception(ex);
    } on Exception catch (ex) {
      throw Exception(ex);
    }
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    mydio.options.headers = headers ??
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${getToken()}',
        };
    try {
      final response = await mydio.post(
        url,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(body ?? {}) : body,
      );
      return response;
    } on DioException catch (ex) {
      throw Exception(ex);
    } on Exception catch (ex) {
      throw Exception(ex);
    }
  }

  Future<Response> updateData({
    required String url,
    required Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      mydio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${getToken()}',
      };
      final response = await mydio.put(url,
          queryParameters: queryParameters,
          data: isFormData ? FormData.fromMap(body ?? {}) : body);

      return response;
    } on DioException catch (ex) {
      throw Exception(ex);
    } on Exception catch (ex) {
      throw Exception(ex);
    }
  }

  Future<Response> deleteData({
    required String url,
    bool isLoading = true,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getToken()}',
    };
    try {
      final response = await mydio.delete(url);

      return response;
    } on DioException catch (ex) {
      throw Exception(ex);
    } on Exception catch (ex) {
      throw Exception(ex);
    }
  }
}
