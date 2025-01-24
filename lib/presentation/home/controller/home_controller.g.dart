// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerStore, Store {
  Computed<bool>? _$isLoadingFeaturedComputed;

  @override
  bool get isLoadingFeatured => (_$isLoadingFeaturedComputed ??= Computed<bool>(
          () => super.isLoadingFeatured,
          name: 'HomeControllerStore.isLoadingFeatured'))
      .value;
  Computed<bool>? _$isLoadingMarvelComputed;

  @override
  bool get isLoadingMarvel =>
      (_$isLoadingMarvelComputed ??= Computed<bool>(() => super.isLoadingMarvel,
              name: 'HomeControllerStore.isLoadingMarvel'))
          .value;
  Computed<bool>? _$isLoadingPagingFeaturedComputed;

  @override
  bool get isLoadingPagingFeatured => (_$isLoadingPagingFeaturedComputed ??=
          Computed<bool>(() => super.isLoadingPagingFeatured,
              name: 'HomeControllerStore.isLoadingPagingFeatured'))
      .value;
  Computed<bool>? _$isLoadingPagingMarvelComputed;

  @override
  bool get isLoadingPagingMarvel => (_$isLoadingPagingMarvelComputed ??=
          Computed<bool>(() => super.isLoadingPagingMarvel,
              name: 'HomeControllerStore.isLoadingPagingMarvel'))
      .value;
  Computed<bool>? _$hasErrorFeaturedComputed;

  @override
  bool get hasErrorFeatured => (_$hasErrorFeaturedComputed ??= Computed<bool>(
          () => super.hasErrorFeatured,
          name: 'HomeControllerStore.hasErrorFeatured'))
      .value;
  Computed<bool>? _$hasErrorMarvelComputed;

  @override
  bool get hasErrorMarvel =>
      (_$hasErrorMarvelComputed ??= Computed<bool>(() => super.hasErrorMarvel,
              name: 'HomeControllerStore.hasErrorMarvel'))
          .value;
  Computed<ObservableList<CharacterModel>>? _$featuredCharactersComputed;

  @override
  ObservableList<CharacterModel> get featuredCharacters =>
      (_$featuredCharactersComputed ??=
              Computed<ObservableList<CharacterModel>>(
                  () => super.featuredCharacters,
                  name: 'HomeControllerStore.featuredCharacters'))
          .value;
  Computed<ObservableList<CharacterModel>>? _$marvelCharactersComputed;

  @override
  ObservableList<CharacterModel> get marvelCharacters =>
      (_$marvelCharactersComputed ??= Computed<ObservableList<CharacterModel>>(
              () => super.marvelCharacters,
              name: 'HomeControllerStore.marvelCharacters'))
          .value;
  Computed<PageInfo>? _$featuredPageInfoComputed;

  @override
  PageInfo get featuredPageInfo => (_$featuredPageInfoComputed ??=
          Computed<PageInfo>(() => super.featuredPageInfo,
              name: 'HomeControllerStore.featuredPageInfo'))
      .value;
  Computed<PageInfo>? _$marvelPageInfoComputed;

  @override
  PageInfo get marvelPageInfo => (_$marvelPageInfoComputed ??=
          Computed<PageInfo>(() => super.marvelPageInfo,
              name: 'HomeControllerStore.marvelPageInfo'))
      .value;

  late final _$_isLoadingFeaturedAtom =
      Atom(name: 'HomeControllerStore._isLoadingFeatured', context: context);

  @override
  bool get _isLoadingFeatured {
    _$_isLoadingFeaturedAtom.reportRead();
    return super._isLoadingFeatured;
  }

  @override
  set _isLoadingFeatured(bool value) {
    _$_isLoadingFeaturedAtom.reportWrite(value, super._isLoadingFeatured, () {
      super._isLoadingFeatured = value;
    });
  }

  late final _$_isLoadingMarvelAtom =
      Atom(name: 'HomeControllerStore._isLoadingMarvel', context: context);

  @override
  bool get _isLoadingMarvel {
    _$_isLoadingMarvelAtom.reportRead();
    return super._isLoadingMarvel;
  }

  @override
  set _isLoadingMarvel(bool value) {
    _$_isLoadingMarvelAtom.reportWrite(value, super._isLoadingMarvel, () {
      super._isLoadingMarvel = value;
    });
  }

  late final _$_isLoadingPagingFeaturedAtom = Atom(
      name: 'HomeControllerStore._isLoadingPagingFeatured', context: context);

  @override
  bool get _isLoadingPagingFeatured {
    _$_isLoadingPagingFeaturedAtom.reportRead();
    return super._isLoadingPagingFeatured;
  }

  @override
  set _isLoadingPagingFeatured(bool value) {
    _$_isLoadingPagingFeaturedAtom
        .reportWrite(value, super._isLoadingPagingFeatured, () {
      super._isLoadingPagingFeatured = value;
    });
  }

  late final _$_isLoadingPagingMarvelAtom = Atom(
      name: 'HomeControllerStore._isLoadingPagingMarvel', context: context);

  @override
  bool get _isLoadingPagingMarvel {
    _$_isLoadingPagingMarvelAtom.reportRead();
    return super._isLoadingPagingMarvel;
  }

  @override
  set _isLoadingPagingMarvel(bool value) {
    _$_isLoadingPagingMarvelAtom
        .reportWrite(value, super._isLoadingPagingMarvel, () {
      super._isLoadingPagingMarvel = value;
    });
  }

  late final _$_hasErrorFeaturedAtom =
      Atom(name: 'HomeControllerStore._hasErrorFeatured', context: context);

  @override
  bool get _hasErrorFeatured {
    _$_hasErrorFeaturedAtom.reportRead();
    return super._hasErrorFeatured;
  }

  @override
  set _hasErrorFeatured(bool value) {
    _$_hasErrorFeaturedAtom.reportWrite(value, super._hasErrorFeatured, () {
      super._hasErrorFeatured = value;
    });
  }

  late final _$_hasErrorMarvelAtom =
      Atom(name: 'HomeControllerStore._hasErrorMarvel', context: context);

  @override
  bool get _hasErrorMarvel {
    _$_hasErrorMarvelAtom.reportRead();
    return super._hasErrorMarvel;
  }

  @override
  set _hasErrorMarvel(bool value) {
    _$_hasErrorMarvelAtom.reportWrite(value, super._hasErrorMarvel, () {
      super._hasErrorMarvel = value;
    });
  }

  late final _$_featuredCharactersAtom =
      Atom(name: 'HomeControllerStore._featuredCharacters', context: context);

  @override
  ObservableList<CharacterModel> get _featuredCharacters {
    _$_featuredCharactersAtom.reportRead();
    return super._featuredCharacters;
  }

  @override
  set _featuredCharacters(ObservableList<CharacterModel> value) {
    _$_featuredCharactersAtom.reportWrite(value, super._featuredCharacters, () {
      super._featuredCharacters = value;
    });
  }

  late final _$_marvelCharactersAtom =
      Atom(name: 'HomeControllerStore._marvelCharacters', context: context);

  @override
  ObservableList<CharacterModel> get _marvelCharacters {
    _$_marvelCharactersAtom.reportRead();
    return super._marvelCharacters;
  }

  @override
  set _marvelCharacters(ObservableList<CharacterModel> value) {
    _$_marvelCharactersAtom.reportWrite(value, super._marvelCharacters, () {
      super._marvelCharacters = value;
    });
  }

  late final _$_featuredPageInfoAtom =
      Atom(name: 'HomeControllerStore._featuredPageInfo', context: context);

  @override
  PageInfo get _featuredPageInfo {
    _$_featuredPageInfoAtom.reportRead();
    return super._featuredPageInfo;
  }

  @override
  set _featuredPageInfo(PageInfo value) {
    _$_featuredPageInfoAtom.reportWrite(value, super._featuredPageInfo, () {
      super._featuredPageInfo = value;
    });
  }

  late final _$_marvelPageInfoAtom =
      Atom(name: 'HomeControllerStore._marvelPageInfo', context: context);

  @override
  PageInfo get _marvelPageInfo {
    _$_marvelPageInfoAtom.reportRead();
    return super._marvelPageInfo;
  }

  @override
  set _marvelPageInfo(PageInfo value) {
    _$_marvelPageInfoAtom.reportWrite(value, super._marvelPageInfo, () {
      super._marvelPageInfo = value;
    });
  }

  late final _$pagingFeaturedAsyncAction =
      AsyncAction('HomeControllerStore.pagingFeatured', context: context);

  @override
  Future<PageInfo> pagingFeatured() {
    return _$pagingFeaturedAsyncAction.run(() => super.pagingFeatured());
  }

  late final _$pagingMarvelAsyncAction =
      AsyncAction('HomeControllerStore.pagingMarvel', context: context);

  @override
  Future<PageInfo> pagingMarvel() {
    return _$pagingMarvelAsyncAction.run(() => super.pagingMarvel());
  }

  late final _$HomeControllerStoreActionController =
      ActionController(name: 'HomeControllerStore', context: context);

  @override
  void _onSuccessGetFeaturedCharacters(PagedData<CharacterModel> data) {
    final _$actionInfo = _$HomeControllerStoreActionController.startAction(
        name: 'HomeControllerStore._onSuccessGetFeaturedCharacters');
    try {
      return super._onSuccessGetFeaturedCharacters(data);
    } finally {
      _$HomeControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onSuccessGetMarvelCharacters(PagedData<CharacterModel> data) {
    final _$actionInfo = _$HomeControllerStoreActionController.startAction(
        name: 'HomeControllerStore._onSuccessGetMarvelCharacters');
    try {
      return super._onSuccessGetMarvelCharacters(data);
    } finally {
      _$HomeControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSearch(String value) {
    final _$actionInfo = _$HomeControllerStoreActionController.startAction(
        name: 'HomeControllerStore.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$HomeControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingFeatured: ${isLoadingFeatured},
isLoadingMarvel: ${isLoadingMarvel},
isLoadingPagingFeatured: ${isLoadingPagingFeatured},
isLoadingPagingMarvel: ${isLoadingPagingMarvel},
hasErrorFeatured: ${hasErrorFeatured},
hasErrorMarvel: ${hasErrorMarvel},
featuredCharacters: ${featuredCharacters},
marvelCharacters: ${marvelCharacters},
featuredPageInfo: ${featuredPageInfo},
marvelPageInfo: ${marvelPageInfo}
    ''';
  }
}
