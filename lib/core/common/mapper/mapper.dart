import 'package:assesment_app/core/common/models/model_base.dart';
import 'package:assesment_app/core/exceptions/app_exceptions.dart';
import 'package:assesment_app/core/utils/enums.dart';
import 'package:logger/logger.dart';

abstract class _Mapper {
  List<T> mapFromList<T extends Model>(
      List jsonList, T Function(Map json) toModel);

  T mapFromJson<T extends Model>(
      Map<String, dynamic> json, T Function(Map json) toModel);
}

/// [Mapper]class Contains the methods reponsable for mapping json and coverting them
/// into dart objects
class Mapper implements _Mapper {
  /// [ mapFromJson]method reponsable to convert the json object coming from api
  @override
  T mapFromJson<T extends Model>(
      Map<String, dynamic> json, T Function(Map json) toModel) {
    try {
      Logger().d("Mapping on json $json");
      Map<String, dynamic> convertedJson = json['data'] ?? {};
      return toModel(convertedJson);
    } catch (e) {
      Logger().e(e);
      throw AppException(
        ExceptionCode.mappingToModelException,
        message: e.toString(),
      );
    }
  }
 /// [mapFromList] use this method when the api respons is a list of json object
  @override
  List<T> mapFromList<T extends Model>(
      List jsonList, T Function(Map json) toModel) {
    try {
      Logger().d("Mapping on list $jsonList");
      List<T> res = [];
      for (Map json in jsonList) {
        final convertingModel = toModel(json);
        res.add(convertingModel);
      }
      return res;
    } catch (e) {
      Logger().e(e);
      throw AppException(
        ExceptionCode.mappingToModelException,
        message: e.toString(),
      );
    }
  }
}
