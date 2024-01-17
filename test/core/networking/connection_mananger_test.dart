



import 'package:assesment_app/core/networking/connection_mananger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';



class MockConnectivity extends Mock implements Connectivity{}
void main(){
 late ConnectionManager connectionManager;
 late MockConnectivity mockConnectivity;

setUp(() {
  mockConnectivity=MockConnectivity();
  connectionManager =ConnectionManagerImpl(connectivity: mockConnectivity)  ;
});

group('isConnected ', () { 
  test('Should call connectivity.checkConnectivity', () async{
    when(()=>mockConnectivity.checkConnectivity()).thenAnswer((_)async =>ConnectivityResult.none  );
    final result=await connectionManager.isConnected();
    verify(()=>mockConnectivity.checkConnectivity());
      verifyNoMoreInteractions(mockConnectivity);
      expect(result, false);
  });
test('Should call connectivity.checkConnectivity', () async{
    when(()=>mockConnectivity.checkConnectivity()).thenAnswer((_)async =>ConnectivityResult.wifi  );
    when(()=>mockConnectivity.checkConnectivity()).thenAnswer((_)async =>ConnectivityResult.mobile  );
    final result=await connectionManager.isConnected();
    verify(()=>mockConnectivity.checkConnectivity());
      verifyNoMoreInteractions(mockConnectivity);
      expect(result, true);
  });

});
  
}
