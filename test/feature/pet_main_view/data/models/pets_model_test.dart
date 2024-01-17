import 'dart:convert';

import 'package:assesment_app/feature/pets_main_view/data/models/breeds_model.dart';
import 'package:assesment_app/feature/pets_main_view/data/models/pets_model.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/breed_entity.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/dogs_entities.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../mocks/mock_pets_model.dart';

void main() {

  test('should be a subclass of PetsEntity class', () async {
    for (var petsModel in petsModel) {
      expect(petsModel, isA<PetsEntity>());
    }
  });

  group('fromJson', () {
    test('Should return a valid model ', () async {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('dogs.json'));
      final result = PetsModel.fromJson(jsonMap);

      expect(result,singlePetModel);
    });

    test('Should return a valid model', () async {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('cats.json'));
      final result = PetsModel.fromJson(jsonMap);

      expect(result, singlePetModel);
    });
  });
}
