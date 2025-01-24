import 'package:serasa/domain/api/data_result/data_result.dart';


class RemoteDataResult implements DataResult {
  final dynamic data;

  RemoteDataResult({required this.data});

  Map get jsonData {
    if (data is Map<String, dynamic>) {
      return data;
    } else {
      throw Exception("Data is not a Json object");
    }
  }
}
