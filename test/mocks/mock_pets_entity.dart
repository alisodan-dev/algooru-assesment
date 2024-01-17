import 'package:assesment_app/feature/pets_main_view/domain/entities/dogs_entities.dart';

import 'mock_breeds_entity.dart';

const petsEntity = [
 singlePetEntity,
 singlePetEntity,
];
const singlePetEntity=PetsEntity(
    breeds: [breedEntity],
    id: 'TestId',
    height: 256,
    url: 'SomeUrl',
    width: 256,
  );
