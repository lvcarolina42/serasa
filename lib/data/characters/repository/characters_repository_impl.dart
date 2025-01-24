import 'package:serasa/data/characters/dto/character_details_dto.dart';
import 'package:serasa/domain/characters/model/character_details_model.dart';
import 'package:serasa/domain/paging/models/paged_data.dart';
import 'package:serasa/domain/utils/result.dart';
import 'package:serasa/data/utils/base_repository.dart';
import 'package:serasa/data/characters/dto/character_dto.dart';
import 'package:serasa/domain/characters/model/character_model.dart';
import 'package:serasa/data/characters/datasource/characters_datasource.dart';
import 'package:serasa/domain/characters/repository/characters_repository.dart';

class CharactersRepositoryImpl extends BaseRepository implements CharactersRepository {
  final CharactersDatasource _dataSource;

  CharactersRepositoryImpl({required CharactersDatasource dataSource}) : _dataSource = dataSource;

  @override
  Future<Result<CharacterDetailsModel, Exception>> getCharacterById({required int id}) async {
   try {
      final response = await _dataSource.getCharactersById(id);
      final responseParsed = CharacterDetailsDto.fromData(response);

      return Result.success(responseParsed);

    } catch (e) {
      return handleFailure(
        error: e,
        trace: StackTrace.current,
        repositoryName: 'CharactersRepository', 
      );
    }
  }

  @override
  Future<Result<PagedData<CharacterModel>, Exception>> getCharacters({String? name, int page = 1}) async {
    try {
      final queryParameters = <String, dynamic>{
        'limit': 10,
        'offset': (page - 1) * 10,
      };

      if (name != null && name.isNotEmpty) queryParameters['name'] = name;

      final response = await _dataSource.getCharacters(queryParameters);
      final responseParsed = CharacterDto.fromDataList(response);

      return Result.success(responseParsed);

    } catch (e) {
      return handleFailure(
        error: e,
        trace: StackTrace.current,
        repositoryName: 'CharactersRepository', 
      );
    }
  }
}