import 'package:serasa/shared/extensions/extension_strings.dart';

extension MapExtension on Map {
  T getValueOrDefault<K, T>({
    required K key,
    required T defaultValue,
  }) {
    var value = this[key];
    return value ?? defaultValue;
  }

  T getDeepValueOrDefault<T>({
    required String keys,
    required T defaultValue,
  }) {
    return _getDeepValueOrDefault(keys: keys, defaultValue: defaultValue);
  }

  dynamic _getDeepValueOrDefault<T>({
    required String keys,
    required T defaultValue,
  }) {
    if (keys.contains("|")) {
      final splitKeys = keys.split("|");
      final value = this[splitKeys[0]];
      if (value is Map) {
        final range = splitKeys..removeAt(0);
        return value._getDeepValueOrDefault(keys: range.join("|"), defaultValue: defaultValue);
      }
    }
    return this[keys] ?? defaultValue;
  }
}
