import 'package:assesment_app/core/failure/failure.dart';
import 'package:assesment_app/core/networking/connection_mananger.dart';
import 'package:assesment_app/feature/pets_main_view/data/data_source/pets_remote_data_source.dart';
import 'package:assesment_app/feature/pets_main_view/data/repository/pets_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mock_pets_entity.dart';

class MockPetsRemoteDataSource extends Mock implements PetsRemoteDataSource {}

class MockConnectionManager extends Mock implements ConnectionManager {}

void main() {
  late PetsRepositoryImp repository;
  late MockPetsRemoteDataSource mockRemoteDataSource;
  late MockConnectionManager mockConnectionManager;

  setUp(() {
    mockRemoteDataSource = MockPetsRemoteDataSource();
    mockConnectionManager = MockConnectionManager();
    repository = PetsRepositoryImp(
      remoteDataSourc: mockRemoteDataSource,
      connectionManager: mockConnectionManager,
    );
  });

  group('list of data when have internet connection', () {
    const limit = 10;
    const page = 1;
    const hasBreed = true;

    test('returns a list of PetsEntity when there is internet connection',
        () async {
      // Arrange
      final expectedDogs = petsEntity;

      when(() => mockConnectionManager.isConnected())
          .thenAnswer((_) async => true);

      when(() => mockRemoteDataSource.getDogs(
            limit: limit,
            page: page,
            hasBreed: hasBreed,
          )).thenAnswer((_) async => expectedDogs);

      // Act
      final result = await repository.getDogs(
        limit: limit,
        page: page,
        hasBreed: hasBreed,
      );

      // Assert
      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => []), equals(expectedDogs));

      verify(() => mockConnectionManager.isConnected()).called(1);
      verify(() => mockRemoteDataSource.getDogs(
            limit: limit,
            page: page,
            hasBreed: hasBreed,
          )).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('returns a Failure when an exception occurs', () async {
      // Arrange
      const exceptionMessage = 'Failed to get dogs';
      final expectedFailure = Failure(
          title: 'Error',
          message: exceptionMessage,
          errorWidget: LottieBuilder(
              lottie: AssetLottie("assets/lottie/error.json"),
              frameBuilder: null));

      when(() => mockConnectionManager.isConnected())
          .thenAnswer((_) async => true);

      // Mock the behavior of the remote data source to throw an exception
      when(() => mockRemoteDataSource.getDogs(
            limit: limit,
            page: page,
            hasBreed: hasBreed,
          )).thenThrow(Exception(exceptionMessage));

      // Act
      final result = await repository.getDogs(
        limit: limit,
        page: page,
        hasBreed: hasBreed,
      );

      // Assert
      expect(result.isLeft(), isTrue);

      // Verify that the appropriate methods were called on the connection manager and remote data source
      verify(() => mockConnectionManager.isConnected()).called(1);
      verify(() => mockRemoteDataSource.getDogs(
            limit: limit,
            page: page,
            hasBreed: hasBreed,
          )).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
