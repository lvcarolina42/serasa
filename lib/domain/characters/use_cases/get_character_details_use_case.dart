import 'package:serasa/domain/characters/model/character_details_model.dart';
import 'package:serasa/domain/characters/repository/characters_repository.dart';
import 'package:serasa/domain/utils/result.dart';

class GetCharacterDetailsUseCase {
  final CharactersRepository _repository;

  GetCharacterDetailsUseCase(this._repository);

  Future<Result<CharacterDetailsModel, Exception>> call({required int id}) async {
    return await _repository.getCharacterById(id: id);
  }
}