import 'package:assesment_app/core/common/models/model_base.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/breed_entity.dart';

class BreedsModel extends BreedEntity implements Model {
  const BreedsModel({
    required super.weight,
    required super.height,
    required super.name,
    required super.lifeSpan,
    required super.temperament,
    required super.referenceImageId,
    required super.countryCode,
    required super.description,
    required super.origin,
  });

  factory BreedsModel.fromJson(Map<String, dynamic> json) {
    return BreedsModel(
      weight: json['weight'] == null
          ? null
          : DimensionsModel.fromJson(json['weight']),
      height: json['height'] == null
          ? null
          : DimensionsModel.fromJson(json['height']),
      name: json['name'],
      lifeSpan: json['life_span'],
      temperament: json['temperament'],
      referenceImageId: json['reference_image_id'],
      origin: json["origin"],
      countryCode: json["country_code"],
      description: json["description"],
    );
  }
}

class DimensionsModel extends DimensionsEntity implements Model {
  const DimensionsModel({
    required super.imperial,
    required super.metric,
  });
  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}
