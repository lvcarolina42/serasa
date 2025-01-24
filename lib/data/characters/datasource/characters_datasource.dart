import 'package:serasa/domain/api/api_handler.dart';
import 'package:serasa/shared/statics/endpoints.dart';

class CharactersDatasource {
  final ApiHandler apiHandler;

  CharactersDatasource({required this.apiHandler});

  Future<dynamic> getCharacters(dynamic queryParameters) async {
    final response = await apiHandler.get(
      Endpoints.characters,
      queryParameters: queryParameters
    );

    return response;
  }

  Future<dynamic> getCharactersById(int id) async {
    final response = await apiHandler.get(
      '${Endpoints.characters}/$id',
    );

    return response;
  }
}