import 'package:assesment_app/core/failure/failure.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/dogs_entities.dart';
import 'package:dartz/dartz.dart';

abstract class PetsRepository{
  Future<Either<Failure,List<PetsEntity>>> getDogs({required int limit,required int page,required bool hasBreed,});
  Future<Either<Failure,List<PetsEntity>>> getCats({required int limit,required int page,required bool hasBreed,});
}