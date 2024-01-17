import 'package:assesment_app/feature/pets_main_view/domain/entities/breed_entity.dart';
import 'package:equatable/equatable.dart';

class PetsEntity extends Equatable{
    final List<BreedEntity>breeds;
    final String id;
    final String url;
    final num? width;
    final num? height;
   
  const PetsEntity({required this.id,required this.height,required this.url,required this.width,required this.breeds});
  @override
  List<Object?> get props =>[id,url,width,height,breeds];

}