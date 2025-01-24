import 'package:serasa/data/utils/extensions/map_extension.dart';
import 'package:serasa/domain/characters/model/thumbnail_model.dart';

extension ThumbnailDto on ThumbnailModel {
  static ThumbnailModel fromData(Map<String, dynamic> data) {
    return ThumbnailModel(
      path: data.getValueOrDefault(key: "path", defaultValue: ""),
      extension: data.getValueOrDefault(key: "extension", defaultValue: ""),
    );
  }
}