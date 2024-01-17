import 'package:assesment_app/feature/pets_main_view/data/models/pets_model.dart';

import 'mock_breeds_model.dart';

const petsModel = [
 singlePetModel,
 singlePetModel,

];

const singlePetModel= PetsModel(
    breeds: [breedsModel],
    id: 'TestId',
    height: 256,
    url: 'SomeUrl',
    width: 256,
  );