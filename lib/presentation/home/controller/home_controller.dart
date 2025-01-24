import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:serasa/domain/characters/model/character_model.dart';
import 'package:serasa/domain/characters/use_cases/get_characters_use_case.dart';
import 'package:serasa/domain/paging/models/paged_data.dart';
import 'package:serasa/presentation/widgets/paged_scrollable.dart/models/page_info.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerStore with _$HomeController;

abstract class HomeControllerStore extends DisposableInterface with Store {
  final GetCharactersUseCase _getCharactersUseCase;

  HomeControllerStore({
    required GetCharactersUseCase getCharactersUseCase,
  }) : _getCharactersUseCase = getCharactersUseCase;

  @observable
  bool _isLoadingFeatured = false;

  @observable
  bool _isLoadingMarvel = false;

  @observable
  bool _isLoadingPagingFeatured = false;

  @observable
  bool _isLoadingPagingMarvel = false;

  @computed
  bool get isLoadingFeatured => _isLoadingFeatured;

  @computed
  bool get isLoadingMarvel => _isLoadingMarvel;

  @computed
  bool get isLoadingPagingFeatured => _isLoadingPagingFeatured;

  @computed
  bool get isLoadingPagingMarvel => _isLoadingPagingMarvel;

  @observable
  bool _hasErrorFeatured = false;

  @computed
  bool get hasErrorFeatured => _hasErrorFeatured;

  @observable
  bool _hasErrorMarvel = false;

  @computed
  bool get hasErrorMarvel => _hasErrorMarvel;

  TextEditingController searchController = TextEditingController();

  @observable
  ObservableList<CharacterModel> _featuredCharacters = <CharacterModel>[
    CharacterModel.empty(),
    CharacterModel.empty(),
    CharacterModel.empty(),
    CharacterModel.empty(),
    CharacterModel.empty(),
  ].asObservable();

  @observable
  ObservableList<CharacterModel> _marvelCharacters = <CharacterModel>[
    CharacterModel.empty(),
    CharacterModel.empty(),
    CharacterModel.empty(),
    CharacterModel.empty(),
    CharacterModel.empty(),
    CharacterModel.empty(),
  ].asObservable();

  @computed
  ObservableList<CharacterModel> get featuredCharacters => _featuredCharacters;

  @computed
  ObservableList<CharacterModel> get marvelCharacters => _marvelCharacters;

  @observable
  PageInfo _featuredPageInfo = PageInfo(
    totalItems: 5,
    hasNextPage: false,
  );

  @observable
  PageInfo _marvelPageInfo = PageInfo(
    totalItems: 6,
    hasNextPage: false,
  );

  @computed
  PageInfo get featuredPageInfo => _featuredPageInfo;

  @computed
  PageInfo get marvelPageInfo => _marvelPageInfo;

  ScrollController featuredCharactersScrollController = ScrollController();

  ScrollController marvelCharactersScrollController = ScrollController();

  Timer? _debounceTimer;
  
  @override
  void onInit() async {
    _isLoadingMarvel = true;
    _isLoadingFeatured = true;
    await _getFeaturedCharacters();
    await _getMarvelCharacters();
    super.onInit();
  }

  Future<void> _getFeaturedCharacters({
    int page = 1,
  }) async {
    _hasErrorFeatured = false;

    final result = await _getCharactersUseCase(page: page);
    
    result.processResult(
      onSuccess: (data) {
        if (page == 1) _featuredCharacters.clear();
        _onSuccessGetFeaturedCharacters(data);
        _isLoadingFeatured = false;
      },
      onFailure: (errorResult) {
        _hasErrorFeatured = true;
        _isLoadingFeatured = false;
      },
    );
  }

  Future<void> _getMarvelCharacters({
    int page = 1,
  }) async {
    _hasErrorMarvel = false;

    final result = await _getCharactersUseCase(
      page: page,
      name: searchController.text,
    );
    
    result.processResult(
      onSuccess: (data) {
        if (page == 1) _marvelCharacters.clear();
        _onSuccessGetMarvelCharacters(data);
        _isLoadingMarvel = false;
      },
      onFailure: (errorResult) {
        _hasErrorMarvel = true;
        _isLoadingMarvel = false;
      },
    );
  }

  @action
  void _onSuccessGetFeaturedCharacters(PagedData<CharacterModel> data) {
    _featuredCharacters = ObservableList.of(_featuredCharacters..addAll(data.items));
    
    _featuredPageInfo = _featuredPageInfo.copyWith(
      totalItems: data.pageData.total,
      hasNextPage: data.pageData.hasNextPage,
      nextPage: data.pageData.currentPage + 1,
    );
  }

  @action
  void _onSuccessGetMarvelCharacters(PagedData<CharacterModel> data) {
    _marvelCharacters = ObservableList.of(_marvelCharacters..addAll(data.items));
    
    _marvelPageInfo = _marvelPageInfo.copyWith(
      totalItems: data.pageData.total,
      hasNextPage: data.pageData.hasNextPage,
      nextPage: data.pageData.currentPage + 1,
    );
  }

  @action
  Future<PageInfo> pagingFeatured() async {
    if (featuredPageInfo.hasNextPage && !isLoadingPagingFeatured && !isLoadingFeatured) {
      _isLoadingPagingFeatured = true;
      await _getFeaturedCharacters(page: featuredPageInfo.nextPage);
      _isLoadingPagingFeatured = false;
    }
    return featuredPageInfo;
  }

  @action
  Future<PageInfo> pagingMarvel() async {
    if (marvelPageInfo.hasNextPage && !isLoadingPagingMarvel && !isLoadingMarvel) {
      _isLoadingPagingMarvel = true;
      await _getMarvelCharacters(page: marvelPageInfo.nextPage);
      _isLoadingPagingMarvel = false;
    }
    return marvelPageInfo;
  }

  @action
  void onSearch(String value) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(seconds: 1), () {
      _isLoadingMarvel = true;
      _marvelCharacters = <CharacterModel>[
        CharacterModel.empty(),
        CharacterModel.empty(),
        CharacterModel.empty(),
        CharacterModel.empty(),
        CharacterModel.empty(),
        CharacterModel.empty(),
      ].asObservable();
      _getMarvelCharacters(page: 1);
    });
  }
}
