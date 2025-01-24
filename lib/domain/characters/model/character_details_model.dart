import 'package:serasa/domain/characters/model/character_model.dart';
import 'package:serasa/domain/characters/model/thumbnail_model.dart';

class CharacterDetailsModel extends CharacterModel {
  final String description;

  CharacterDetailsModel({
    required super.id,
    required super.name,
    required super.thumbnail,
    required this.description,
  });

  CharacterDetailsModel.fromBaseCharacter(CharacterModel character) : this(
    description: "",
    id: character.id,
    name: character.name,
    thumbnail: character.thumbnail,
  );

  CharacterDetailsModel.empty() : this(
    id: 0,
    name: "",
    description: "",
    thumbnail: ThumbnailModel.empty(),
  );
}