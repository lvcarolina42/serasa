import 'package:get_it/get_it.dart';
import 'package:serasa/domain/api/client/api.dart';
import 'package:serasa/domain/api/api_handler.dart';
import 'package:serasa/data/api/api_handler_impl.dart';
import 'package:serasa/data/api/client/default_client.dart';
import 'package:serasa/data/characters/datasource/characters_datasource.dart';
import 'package:serasa/domain/characters/repository/characters_repository.dart';
import 'package:serasa/domain/characters/use_cases/get_characters_use_case.dart';
import 'package:serasa/data/characters/repository/characters_repository_impl.dart';
import 'package:serasa/domain/characters/use_cases/get_character_details_use_case.dart';

class DependencyInjector {
  final GetIt _getIt = GetIt.I;

  void setup() {
    _registerApiClient();
    _registerDatasources();
    _registerRepository();
    _registerUseCase();
  }

  void _registerApiClient() {
    _getIt.registerFactory<Api>(
      () => DefaultClient(),
      instanceName: 'DefaultClient',
    );
    _getIt.registerFactory<ApiHandler>(
      () => ApiHandlerImpl(
        _getIt(instanceName: 'DefaultClient'),
      ),
    );
  }

  void _registerDatasources() {
    _getIt.registerFactory<CharactersDatasource>(
      () => CharactersDatasource(apiHandler: _getIt()),
    );
  }

  void _registerRepository() {
    _getIt.registerFactory<CharactersRepository>(
      () => CharactersRepositoryImpl(
        dataSource: _getIt(),
      ),
    );
  }

  void _registerUseCase() {
    _getIt.registerFactory(
      () => GetCharactersUseCase(GetIt.I())
    );
    _getIt.registerFactory(
      () => GetCharacterDetailsUseCase(GetIt.I())
    );
  }
}
