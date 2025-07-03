import '../constant/strings.dart';

abstract class EnTranslation {
  static Map<String, String> get map => {
    AppStringKey.noInternet: "No Internet Connection",
    AppStringKey.requestTimeOut: "Request Time Out",
    AppStringKey.somethingWentWrong: "Something went wrong!!",
    AppStringKey.home: "Home",
    AppStringKey.noEmployeeFound: "Sorry, No Employee Found!!",
    AppStringKey.catchMeByGivenDetails:
        "You can catch me by given below details",
    AppStringKey.lastOpened: "Last Opened",
  };
}
