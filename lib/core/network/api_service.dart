import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/dio_client.dart';

class ApiService {
  DioClient _dioClient = DioClient();

  Future<dynamic> get(String endPoint) async {
    try {
      final respose = await _dioClient.dio.get(endPoint);
      return respose.data;
    } on DioError catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  Future<dynamic> post(String endPoint, Map<String, dynamic> body) async {
    try {
      final respose = await _dioClient.dio.post(endPoint, data: body);
      return respose.data;
    } on DioError catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  Future<dynamic> put(String endPoint, Map<String, dynamic> body) async {
    try {
      final respose = await _dioClient.dio.put(endPoint, data: body);
      return respose.data;
    } on DioError catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  Future<dynamic> delete(String endPoint, Map<String, dynamic> body) async {
    try {
      final respose = await _dioClient.dio.put(endPoint, data: body);
      return respose.data;
    } on DioError catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
