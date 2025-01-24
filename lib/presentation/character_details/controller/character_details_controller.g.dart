// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailsController on CharacterDetailsControllerStore, Store {
  Computed<CharacterDetailsModel>? _$characterDetailsComputed;

  @override
  CharacterDetailsModel get characterDetails => (_$characterDetailsComputed ??=
          Computed<CharacterDetailsModel>(() => super.characterDetails,
              name: 'CharacterDetailsControllerStore.characterDetails'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: 'CharacterDetailsControllerStore.hasError'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'CharacterDetailsControllerStore.isLoading'))
          .value;

  late final _$_characterDetailsAtom = Atom(
      name: 'CharacterDetailsControllerStore._characterDetails',
      context: context);

  @override
  CharacterDetailsModel get _characterDetails {
    _$_characterDetailsAtom.reportRead();
    return super._characterDetails;
  }

  @override
  set _characterDetails(CharacterDetailsModel value) {
    _$_characterDetailsAtom.reportWrite(value, super._characterDetails, () {
      super._characterDetails = value;
    });
  }

  late final _$_hasErrorAtom =
      Atom(name: 'CharacterDetailsControllerStore._hasError', context: context);

  @override
  bool get _hasError {
    _$_hasErrorAtom.reportRead();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.reportWrite(value, super._hasError, () {
      super._hasError = value;
    });
  }

  late final _$_isLoadingAtom = Atom(
      name: 'CharacterDetailsControllerStore._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  @override
  String toString() {
    return '''
characterDetails: ${characterDetails},
hasError: ${hasError},
isLoading: ${isLoading}
    ''';
  }
}
