import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:serasa/domain/api/client/api.dart';
import 'package:serasa/shared/constants/project_constants.dart';

class DefaultClient implements Api {
  @override
  late final Dio client;
  
  DefaultClient() {
    client = Dio()
      ..options.connectTimeout = const Duration(milliseconds: 8000)
      ..options.headers = {"Referer": "https://developer.marvel.com",}
      ..options.queryParameters = {"apikey": apiKey}
      ..httpClientAdapter = IOHttpClientAdapter()
      ..options.baseUrl = baseUrl;
  }
}
