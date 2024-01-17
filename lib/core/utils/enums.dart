///Themetype used in the app
enum ThemeType{
  lightTheme('Light Theme'),
  darkTheme('Dark Theme'),
  systemTheme('Use System Theme');
  final String name;
  const ThemeType(this.name); 
}
///Exceptions in this app
enum ExceptionCode{
  canceled,
  badResponse,
  badCertificate,
  noInternetConnection,
  mappingToModelException,
  unKnown,
  forbieden,
  notFound,
  serverError,
}

///Http request type using dio package.
enum RequestType {
  get,
  post,
  delete,
  put,

}
