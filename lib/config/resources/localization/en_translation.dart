import '../constant/strings.dart';

abstract class EnTranslation {
  static Map<String, String> get map => {
    AppStringKey.noInternet: "No Internet Connection",
    AppStringKey.requestTimeOut : "Request Time Out",
    AppStringKey.somethingWentWrong : "Something went wrong!!"
  };
}
