import 'dart:io';

import 'package:assesment_app/core/extension/exception_extension.dart';
import 'package:assesment_app/core/failure/failure.dart';
import 'package:assesment_app/core/networking/connection_mananger.dart';
import 'package:assesment_app/feature/pets_main_view/data/data_source/pets_remote_data_source.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/dogs_entities.dart';
import 'package:assesment_app/feature/pets_main_view/domain/repositories/pets_repository.dart';
import 'package:dartz/dartz.dart';

class PetsRepositoryImp implements PetsRepository{
  final PetsRemoteDataSource remoteDataSourc;
  final ConnectionManager connectionManager;
  PetsRepositoryImp({required this.remoteDataSourc,
  required this.connectionManager,
  });
  @override
  Future<Either<Failure, List<PetsEntity>>> getDogs({required int limit,required int page,required bool hasBreed})async {
  final isConnected =await connectionManager.isConnected();
  try{
   if(isConnected){
   final result =await remoteDataSourc.getDogs(hasBreed: hasBreed,limit: limit,page: page) ;
   return Right(result);
   }else{
    throw const SocketException('No Internet Connection');
  }
  }on Exception catch(e){
    return Left(e.toFailure);
   }
  }
  
  @override
  Future<Either<Failure, List<PetsEntity>>> getCats({required int limit, required int page, required bool hasBreed}) async{
    try{
   final result =await remoteDataSourc.getCats(hasBreed: hasBreed,limit: limit,page: page);
   return Right(result);
  }on Exception catch(e){
    return Left(e.toFailure);
  }
  }

}