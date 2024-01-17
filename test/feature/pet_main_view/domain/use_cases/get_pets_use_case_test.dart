import 'package:assesment_app/core/failure/failure.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/dogs_entities.dart';
import 'package:assesment_app/feature/pets_main_view/domain/repositories/pets_repository.dart';
import 'package:assesment_app/feature/pets_main_view/domain/use_cases/get_pets_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mock_pets_entity.dart';

class MockPetsRepository extends Mock implements PetsRepository {}

void main() {
  late MockPetsRepository mockPetsRepository;
  late GetPetsUseCases useCase;
  setUp(() {
    mockPetsRepository = MockPetsRepository();
    useCase = GetPetsUseCases(mockPetsRepository);
  });

  group('should get pets from the repository', () {
    test('Should get dogs', () async {
      // arrange
      const limit = 10;
      const page = 0;
      const hasBreed = true;
      when(() => mockPetsRepository.getDogs(
              limit: any(named: 'limit'),
              page: any(named: 'page'),
              hasBreed: any(named: 'hasBreed')))
          .thenAnswer((_) async => const Right(petsEntity));
      // act
      final result =
          await useCase.getDogs(limit: limit, page: page, hasBreed: hasBreed);
      // assert
      expect(
         result, equals(const Right(petsEntity)));
      verify(() =>
              mockPetsRepository.getDogs(limit: 10, page: 0, hasBreed: true))
          .called(1);
      verifyNoMoreInteractions(mockPetsRepository);
    });
    test('Should get cats', () async {
      // arrange
      when(
        () => mockPetsRepository.getCats(
          limit: any(named: 'limit'),
          page: any(named: 'page'),
          hasBreed: any(
            named: 'hasBreed',
          ),
        ),
      ).thenAnswer((_) async => const Right(petsEntity));
      // act
      final result = await useCase.getCats(limit: 10, page: 0, hasBreed: true);
      // assert
      expect(
        result,
        const Right<dynamic, List<PetsEntity>>(petsEntity),
      );
      verify(() =>
              mockPetsRepository.getCats(limit: 10, page: 0, hasBreed: true))
          .called(1);
      verifyNoMoreInteractions(mockPetsRepository);
    });
  });
}
