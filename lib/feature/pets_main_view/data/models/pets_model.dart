import 'package:assesment_app/core/common/models/model_base.dart';
import 'package:assesment_app/feature/pets_main_view/data/models/breeds_model.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/dogs_entities.dart';

class PetsModel extends PetsEntity implements Model {
  const PetsModel({
    required super.breeds,
    required super.id,
    required super.height,
    required super.url,
    required super.width,
  
  });
  factory PetsModel.fromJson(Map<String, dynamic> json) {
    return PetsModel(
        breeds: (json['breeds'] as List<dynamic>).map((e) => BreedsModel.fromJson(e)).toList(),
        id: json['id'],
        height: json['height'],
        url: json['url'],
        width: json['width'],
      );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'breeds': breeds,
        'id': id,
        'height': height,
        'width': width,
        'url': url,
      };
}
