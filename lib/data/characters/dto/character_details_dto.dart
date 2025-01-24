import 'package:serasa/data/api/data_result/remote_data_result.dart';
import 'package:serasa/data/characters/dto/thumbnail_dto.dart';
import 'package:serasa/data/utils/extensions/map_extension.dart';
import 'package:serasa/domain/api/data_result/data_result.dart';
import 'package:serasa/domain/characters/model/character_details_model.dart';

extension CharacterDetailsDto on CharacterDetailsModel {
  static CharacterDetailsModel fromData(DataResult dataResult) {
    dataResult as RemoteDataResult;

    final Map<String, dynamic> data = dataResult.jsonData.getDeepValueOrDefault(
      keys: "data|results",
      defaultValue: [],
    ).first;

    return CharacterDetailsModel(
      id: data.getDeepValueOrDefault(keys: "id", defaultValue: 0),
      name: data.getDeepValueOrDefault(keys: "name", defaultValue: ""),
      description: data.getDeepValueOrDefault(keys: "description", defaultValue: ""),
      thumbnail: ThumbnailDto.fromData(
        data.getValueOrDefault(key: "thumbnail", defaultValue: {}),
      ),
    );
  }
}