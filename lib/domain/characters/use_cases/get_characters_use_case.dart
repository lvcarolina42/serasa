import 'package:serasa/domain/characters/model/character_model.dart';
import 'package:serasa/domain/characters/repository/characters_repository.dart';
import 'package:serasa/domain/paging/models/paged_data.dart';
import 'package:serasa/domain/utils/result.dart';

class GetCharactersUseCase {
  final CharactersRepository _repository;

  GetCharactersUseCase(this._repository);

  Future<Result<PagedData<CharacterModel>, Exception>> call({String? name, int page = 1}) async {
    return await _repository.getCharacters(name: name, page: page);
  }
}