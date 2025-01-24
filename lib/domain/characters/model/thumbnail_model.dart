class ThumbnailModel {
  final String path;
  final String extension;

  ThumbnailModel({
    required this.path,
    required this.extension,
  });

  ThumbnailModel.empty() : this(path: "", extension: "");

  String get imageUrl => "$path.$extension";
}