import 'package:serasa/domain/characters/model/character_details_model.dart';
import 'package:serasa/domain/characters/model/character_model.dart';
import 'package:serasa/domain/paging/models/paged_data.dart';
import 'package:serasa/domain/utils/result.dart';

abstract class CharactersRepository {
  Future<Result<PagedData<CharacterModel>, Exception>> getCharacters({
    String? name,
    int page = 1,
  });

  Future<Result<CharacterDetailsModel, Exception>> getCharacterById({
    required int id,
  });
}