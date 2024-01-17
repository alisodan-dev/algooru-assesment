import 'package:assesment_app/core/managers.dart';
import 'package:assesment_app/core/networking/api_service.dart';
import 'package:assesment_app/core/networking/network_configurations.dart';
import 'package:assesment_app/core/utils/enums.dart';
import 'package:assesment_app/feature/pets_main_view/data/models/pets_model.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/dogs_entities.dart';

abstract class PetsRemoteDataSource {
  Future<List<PetsEntity>> getDogs(
      {required int page, required int limit, required bool hasBreed});
  Future<List<PetsEntity>> getCats(
      {required int page, required int limit, required bool hasBreed});
}

class PetsRemoteDataSourceImp implements PetsRemoteDataSource {
  @override
  Future<List<PetsEntity>> getDogs(
      {required int limit, required int page, required bool hasBreed}) async {
    final request = ApiRequest(
        url: NetworkConfigurations.instance.kDogsBaseUrl +
            NetworkConfigurations.instance.imagesEndPoint,
        requestType: RequestType.get,
        headers: NetworkConfigurations.instance.kDogsBaseHeaders,
        params: <String, String>{
          "limit": "$limit",
          "page": "$page",
          "has_breeds": "$hasBreed"
        });
    final response = await Managers.api.request(request);
    final json = (response.body) as List<dynamic>;
    if (response.success) {
      final dogsList = Managers.mapper.mapFromList<PetsModel>(
        json,
        (json) => PetsModel.fromJson(json as Map<String, dynamic>),
      );
      return dogsList;
    } else {
      throw Exception(
        response.body?['message'] ?? "Error while getting dogs",
      );
    }
  }

  @override
  Future<List<PetsEntity>> getCats(
      {required int page, required int limit, required bool hasBreed}) async {
    final request = ApiRequest(
        url: NetworkConfigurations.instance.kCatsBaseUrl +
            NetworkConfigurations.instance.imagesEndPoint,
        requestType: RequestType.get,
        headers: NetworkConfigurations.instance.kCatsBaseHeaders,
        params: <String, String>{
          "limit": "$limit",
          "page": "$page",
          "has_breeds": "$hasBreed"
        });

    final response = await Managers.api.request(request);
    final json = (response.body) as List<dynamic>;
    if (response.success) {
      final dogsList = Managers.mapper.mapFromList<PetsModel>(
        json,
        (json) => PetsModel.fromJson(json as Map<String, dynamic>),
      );
      return dogsList;
    } else {
      throw Exception(
        response.body?['message'] ?? "Error while getting dogs",
      );
    }
  }
}
