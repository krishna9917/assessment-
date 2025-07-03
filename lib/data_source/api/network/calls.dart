import 'response/response.dart';

abstract class ApiMethods {
  Future callGetMethod<T>(
    String url,
    Function(ApiResponse<T> responseStatus) callBack, {
    bool showProgress = false, T Function(dynamic) fromJson,
  });

}
