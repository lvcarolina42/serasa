import 'package:dio/dio.dart';
import 'package:serasa/domain/api/data_result/data_result.dart';

abstract class ApiHandler {
  Future<DataResult> get(
    String path, {
    Map? body,
    Options? options,
    Map<String, dynamic>? queryParameters,
  });
}
