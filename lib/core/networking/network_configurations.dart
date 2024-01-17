

class NetworkConfigurations{

 const NetworkConfigurations._internal();

  static const NetworkConfigurations instance = NetworkConfigurations._internal();

 final String _kCatsBaseUrl="https://api.thecatapi.com/v1/";
 final String _kDogsBaseUrl="https://api.thedogapi.com/v1/";
 final Map<String, String> _catsBaseHeaders = const{
    "accept": "application/json, */* ,charset=UTF-8",
    "Charset": "utf-8",
    "Content-Type": "application/json",
    "x-api-key":"live_OXhzUEMvwy1GuK2lUaFuyDyxbnRZ2127n8QfAAA7QE1lNlayTOP2lIO9BXus1Okm"
  };

  final Map<String, String> _dogsBaseHeaders =const {
    "accept": "application/json, */* ,charset=UTF-8",
    "Charset": "utf-8",
    "Content-Type": "application/json",
    "x-api-key":"live_cdguxZvvUhqgrkxqnPwBZ7hpT8ydiBKcifrUTL3hr5cohMeaftB8jWWSfzXiJiYO"
  };
  
  String get kCatsBaseUrl =>_kCatsBaseUrl;
  String get kDogsBaseUrl=>_kDogsBaseUrl;

  Map<String, String> get kCatsBaseHeaders=>_catsBaseHeaders;
  Map<String, String> get kDogsBaseHeaders=>_dogsBaseHeaders;


   final String _imagesEndPoint= "images/search";
   String get imagesEndPoint=>_imagesEndPoint;

         
}