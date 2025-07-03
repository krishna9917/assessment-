import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:assesment/config/resources/constant/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/utilities_functions/util_functions.dart';
import 'apiExceptionHandler/exception_handel.dart';
import 'calls.dart';
import 'end_point.dart';
import 'response/response.dart';

class ApiService implements ApiMethods {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal();

  // Define common headers
  Map<String, String> getHeaders() {
    return {'Content-Type': 'application/json', 'Accept': 'application/json'};
  }

  @override
  Future callGetMethod<T>(
    String endPoint,
    Function(ApiResponse<T> responseStatus) callBack, {
    bool showProgress = false,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      callBack(ApiResponse.loading());
      if (showProgress) {
        UtilFunctions.circularProgress();
      }
      print(
        "API : ${ApiEndPoints.baseUrl + endPoint}  \n Headers : ${getHeaders()}",
      );
      final response = await http
          .get(
            Uri.parse(ApiEndPoints.baseUrl + endPoint),
            headers: getHeaders(), // Add headers here
          )
          .timeout(Duration(seconds: 10));
      returnResponse(response, callBack, fromJson!);
    } on SocketException {
      callBack(ApiResponse.error(AppStringKey.noInternet.tr));
      throw InternetException();
    } on TimeoutException {
      callBack(ApiResponse.error(AppStringKey.requestTimeOut.tr));
      throw RequestTimeOut();
    } finally {
      callBack(ApiResponse.error("Something went wrong"));
      if (showProgress) {
        Get.back();
      }
    }
  }

  returnResponse<T>(
    http.Response response,
    Function(ApiResponse<T> responseStatus) callBack,
    T Function(dynamic) fromJson,
  ) {
    dynamic responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        callBack(ApiResponse.completed(fromJson(responseJson)));
        break;
      case 400:
        callBack(ApiResponse.error(responseJson['message']));
        throw BadRequest(responseJson['message']);
      default:
        callBack(ApiResponse.error(responseJson['message']));
        throw ErrorCommunicationException(responseJson['message']);
    }
  }
}
