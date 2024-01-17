import 'package:assesment_app/core/failure/failure.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/dogs_entities.dart';
import 'package:assesment_app/feature/pets_main_view/domain/repositories/pets_repository.dart';
import 'package:dartz/dartz.dart';

class GetPetsUseCases{
  final PetsRepository repository;
  const GetPetsUseCases(this.repository);
  Future<Either<Failure,List<PetsEntity>>>getDogs({required int limit,required int page,required bool hasBreed})=>repository.getDogs(hasBreed: hasBreed,limit: limit,page: page);
  Future<Either<Failure,List<PetsEntity>>>getCats({required int limit,required int page,required bool hasBreed})=>repository.getCats(hasBreed: hasBreed,limit: limit,page: page);
}