import 'package:equatable/equatable.dart';

class BreedEntity extends Equatable {
  const BreedEntity({
    required this.weight,
    required this.height,
    required this.name,
    required this.lifeSpan,
    required this.temperament,
    required this.referenceImageId,
    required this.countryCode,
    required this.description,
    
    required this.origin,
   
  });

  final DimensionsEntity? weight;
  final DimensionsEntity? height;
  final String? name;
  final String? lifeSpan;
  final String? temperament;
  final String? referenceImageId;
  final String? origin;
  final String? countryCode;
  final String? description;

  @override
  List<Object?> get props => [
        weight,
        height,
        name,
        lifeSpan,
        temperament,
        referenceImageId,
        origin,
        countryCode,
        description,
       
      ];
}

class DimensionsEntity extends Equatable {
  const DimensionsEntity({
    required this.imperial,
    required this.metric,
  });

  final String? imperial;
  final String? metric;

  @override
  List<Object?> get props => [imperial, metric];
}
