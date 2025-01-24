import 'package:serasa/domain/characters/model/thumbnail_model.dart';

class CharacterModel {
  final int id;
  final String name;
  final ThumbnailModel thumbnail;

  CharacterModel({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  CharacterModel.empty() : id = 0, name = "", thumbnail = ThumbnailModel.empty();
}