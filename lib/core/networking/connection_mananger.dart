import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';

abstract class ConnectionManager {

  Future<bool> isConnected();
}

class ConnectionManagerImpl implements ConnectionManager {
  final Connectivity connectivity ;
  ConnectionManagerImpl({required this.connectivity});
  @override
  Future<bool> isConnected() async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Logger().e("Don't have internet connection");
      return false;
    } else {
      Logger().d(" have internet connection $connectivityResult");
      return true;
    }
  }
}
