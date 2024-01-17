import 'package:assesment_app/core/common/mapper/mapper.dart';
import 'package:assesment_app/core/networking/api_service.dart';
import 'package:assesment_app/core/networking/connection_mananger.dart';
import 'package:assesment_app/feature/pets_main_view/data/data_source/pets_remote_data_source.dart';
import 'package:assesment_app/feature/pets_main_view/data/repository/pets_repository_imp.dart';
import 'package:assesment_app/feature/pets_main_view/domain/repositories/pets_repository.dart';
import 'package:assesment_app/feature/pets_main_view/domain/use_cases/get_pets_use_case.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initServiceLocator() {
  getIt
     ..registerSingleton<Dio>(Dio())
    ..registerSingleton<Api>(ApiServices(dio: getIt<Dio>()))
    ..registerSingleton<Mapper>(Mapper())
    ..registerSingleton<ConnectionManager>(
        ConnectionManagerImpl(connectivity: Connectivity()))
    ..registerSingleton<PetsRemoteDataSourceImp>(PetsRemoteDataSourceImp())
    ..registerSingleton<PetsRepository>(PetsRepositoryImp(
        remoteDataSourc: getIt<PetsRemoteDataSourceImp>(),
        connectionManager: getIt<ConnectionManager>()))
    ..registerSingleton<GetPetsUseCases>(
        GetPetsUseCases(getIt<PetsRepository>()));
}
