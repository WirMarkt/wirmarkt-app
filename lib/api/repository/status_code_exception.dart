
class StatusCodeException implements Exception {
  final int statusCode;
  final String? _message;
  final String? _prefix;

  StatusCodeException(this.statusCode, [this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message, Status Code = $statusCode";
  }
}

class FetchDataException extends StatusCodeException {
  FetchDataException(statusCode, [String? message])
      : super(statusCode, message, "Error During Communication: ");
}

class BadRequestException extends StatusCodeException {
  BadRequestException(statusCode, [message])
      : super(statusCode, message, "Invalid Request: ");
}

class UnauthorisedException extends StatusCodeException {
  UnauthorisedException(statusCode, [message])
      : super(statusCode, message, "Unauthorised: ");
}

class InvalidInputException extends StatusCodeException {
  InvalidInputException(statusCode, [String? message])
      : super(statusCode, message, "Invalid Input: ");
}
