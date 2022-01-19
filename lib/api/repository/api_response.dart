
import '../utils/fetch_status.dart';

class ApiResponse<T> {
  FetchStatus status;
  int? statusCode;
  T? data;

  ApiResponse.loading() : status = FetchStatus.loading;

  ApiResponse.completed(this.data, [this.statusCode = 200])
      : status = FetchStatus.completed;

  ApiResponse.error(this.statusCode) : status = FetchStatus.error;

  @override
  String toString() {
    return "Status: $status \n Status Code: $statusCode \n Data: $data";
  }
}
