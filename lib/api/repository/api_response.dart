
import '../utils/status.dart';

class ApiResponse<T> {
  Status status;
  int? statusCode;
  T? data;

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data, [this.statusCode = 200])
      : status = Status.completed;

  ApiResponse.error(this.statusCode) : status = Status.error;

  @override
  String toString() {
    return "Status: $status \n Status Code: $statusCode \n Data: $data";
  }
}
