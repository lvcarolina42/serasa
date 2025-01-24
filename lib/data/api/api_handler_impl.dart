import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:serasa/domain/api/client/api.dart';
import 'package:serasa/domain/api/api_handler.dart';
import 'package:serasa/domain/api/data_result/data_result.dart';
import 'package:serasa/data/api/data_result/remote_data_result.dart';

class ApiHandlerImpl implements ApiHandler {
  final Api api;
  ApiHandlerImpl(this.api);

  @override
  Future<DataResult> get(
    String path, {
    Map? body,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await api.client.get(
      path,
      data: json.encode(body),
      queryParameters: queryParameters,
    );
    return RemoteDataResult(data: response.data);
  }
}
