import 'dart:async';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:serasa/domain/characters/model/character_model.dart';
import 'package:serasa/domain/characters/model/character_details_model.dart';
import 'package:serasa/domain/characters/use_cases/get_character_details_use_case.dart';

part 'character_details_controller.g.dart';

class CharacterDetailsController = CharacterDetailsControllerStore with _$CharacterDetailsController;

abstract class CharacterDetailsControllerStore extends DisposableInterface with Store {
  final GetCharacterDetailsUseCase _getCharacterDetailsUseCase;

  CharacterDetailsControllerStore({
    required GetCharacterDetailsUseCase getCharacterDetailsUseCase,
  }) : _getCharacterDetailsUseCase = getCharacterDetailsUseCase;

  @observable
  CharacterDetailsModel _characterDetails = CharacterDetailsModel.empty();

  @computed
  CharacterDetailsModel get characterDetails => _characterDetails;

  CharacterModel? baseCharacter;

  @observable
  bool _hasError = false;

  @computed
  bool get hasError => _hasError;

  @observable
  bool _isLoading = false;

  @computed
  bool get isLoading => _isLoading;

  @override
  void onInit() async {
    _isLoading = true;
    baseCharacter = Get.arguments as CharacterModel;
    if (baseCharacter != null) {
      _characterDetails = CharacterDetailsModel.fromBaseCharacter(baseCharacter!);
    } else {
      _hasError = true;
      return;
    }
    await _getCharacterDetails();
    super.onInit();
  }

  Future<void> _getCharacterDetails() async {
    _hasError = false;

    final result = await _getCharacterDetailsUseCase(id: baseCharacter!.id);
    
    result.processResult(
      onSuccess: (data) {
        _characterDetails = data;
        _isLoading = false;
      },
      onFailure: (errorResult) {
        _hasError = true;
        _isLoading = false;
      },
    );
  }
}
