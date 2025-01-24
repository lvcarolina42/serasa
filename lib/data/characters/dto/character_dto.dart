import 'package:serasa/data/api/data_result/remote_data_result.dart';
import 'package:serasa/data/characters/dto/thumbnail_dto.dart';
import 'package:serasa/data/utils/extensions/map_extension.dart';
import 'package:serasa/domain/api/data_result/data_result.dart';
import 'package:serasa/domain/characters/model/character_model.dart';
import 'package:serasa/domain/paging/models/page_data.dart';
import 'package:serasa/domain/paging/models/paged_data.dart';

extension CharacterDto on PagedData {
  static PagedData<CharacterModel> fromDataList(DataResult dataResult) {
    dataResult as RemoteDataResult;

    final Map data = dataResult.jsonData.getDeepValueOrDefault(
      keys: "data",
      defaultValue: {},
    );

    final List<dynamic> results = dataResult.jsonData.getDeepValueOrDefault(
      keys: "data|results",
      defaultValue: [],
    );

    return PagedData(
      items: results.map((character) => fromData(character)).toList(),
      pageData: PageData(
        perPage: 10,
        totalPages: (data.getValueOrDefault(key: 'total', defaultValue: 0)) ~/ 10,
        currentPage: (data.getValueOrDefault(key: 'offset', defaultValue: 1)) ~/ 10 + 1,
        total: data.getValueOrDefault(
          key: "total",
          defaultValue: 0,
        ),
      ),
    );
  }

  static CharacterModel fromData(Map<String, dynamic> data) {
    return CharacterModel(
      id: data.getDeepValueOrDefault(keys: "id", defaultValue: 0),
      name: data.getDeepValueOrDefault(keys: "name", defaultValue: ""),
      thumbnail: ThumbnailDto.fromData(
        data.getValueOrDefault(key: "thumbnail", defaultValue: {}),
      ),
    );
  }
}