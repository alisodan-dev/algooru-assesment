import 'package:assesment_app/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

///[AppException] the class responsable to handle errors and failures inside our app
///  Exception code is an enum containing different errors sitution
/// and a string description the error message
class AppException extends Equatable implements Exception {
  final ExceptionCode code;
  final String? message;

  const AppException(this.code, {this.message});

  @override
  List<Object?> get props => [
        code,
        message,
      ];
}
