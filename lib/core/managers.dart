import 'package:assesment_app/core/common/mapper/mapper.dart';
import 'package:assesment_app/core/networking/api_service.dart';
import 'package:assesment_app/core/service_locator.dart';

class Managers{
  static Api api=getIt<Api>();
  static Mapper mapper = getIt<Mapper>();
}