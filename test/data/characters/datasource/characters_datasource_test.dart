import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:serasa/domain/api/api_handler.dart';
import 'package:serasa/shared/statics/endpoints.dart';
import 'package:serasa/data/api/data_result/remote_data_result.dart';
import 'package:serasa/data/characters/datasource/characters_datasource.dart';

class MockApiHandler extends Mock implements ApiHandler {}

void main() {
  late MockApiHandler mockApiHandler;
  late CharactersDatasource charactersDatasource;

  setUp(() {
    mockApiHandler = MockApiHandler();
    charactersDatasource = CharactersDatasource(apiHandler: mockApiHandler);
  });

  group('CharactersDatasource', () {
    group('getCharacters', () {
      test('should return data when the API call is successful', () async {
        // Arrange
        final queryParameters = {'name': 'Spider-Man'};
        final mockResponse = RemoteDataResult(data: {'data': 'mockCharacterData'});
        when(() => mockApiHandler.get(Endpoints.characters, queryParameters: queryParameters))
            .thenAnswer((_) async => mockResponse);

        // Act
        final result = await charactersDatasource.getCharacters(queryParameters);

        // Assert
        expect(result, mockResponse);
        verify(() => mockApiHandler.get(Endpoints.characters, queryParameters: queryParameters)).called(1);
      });

      test('should throw an error when the API call fails', () async {
        // Arrange
        final queryParameters = {'name': 'Spider-Man'};
        final exception = Exception('Failed to fetch characters');
        when(() => mockApiHandler.get(Endpoints.characters, queryParameters: queryParameters))
            .thenThrow(exception);

        // Act & Assert
        expect(
          () => charactersDatasource.getCharacters(queryParameters),
          throwsA(isA<Exception>()),
        );
        verify(() => mockApiHandler.get(Endpoints.characters, queryParameters: queryParameters)).called(1);
      });
    });

    group('getCharactersById', () {
      test('should return data when the API call is successful', () async {
        // Arrange
        const characterId = 1;
        final mockResponse = RemoteDataResult(data: {'id': characterId, 'name': 'Spider-Man'});
        when(() => mockApiHandler.get('${Endpoints.characters}/$characterId'))
            .thenAnswer((_) async => mockResponse);

        // Act
        final result = await charactersDatasource.getCharactersById(characterId);

        // Assert
        expect(result, mockResponse);
        verify(() => mockApiHandler.get('${Endpoints.characters}/$characterId')).called(1);
      });

      test('should throw an error when the API call fails', () async {
        // Arrange
        const characterId = 1;
        final exception = Exception('Failed to fetch character by ID');
        when(() => mockApiHandler.get('${Endpoints.characters}/$characterId')).thenThrow(exception);

        // Act & Assert
        expect(
          () => charactersDatasource.getCharactersById(characterId),
          throwsA(isA<Exception>()),
        );
        verify(() => mockApiHandler.get('${Endpoints.characters}/$characterId')).called(1);
      });
    });
  });
}
