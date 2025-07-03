import '../api/models/employee.dart';
import '../api/network/end_point.dart';
import '../api/network/response/response.dart';
import '../api/network/service.dart';

class EmployeeRepository {
  final ApiService _apiService = ApiService();

  Future<void> getEmployee(
    Function(ApiResponse<List<Employee>> response) callBack, {
    int page = 1,
  }) {
    return _apiService.callGetMethod(
      "${ApiEndPoints.users}?_page=$page&_limit=10",
      callBack,
      fromJson: Employee.fromJson,
    );
  }
}
