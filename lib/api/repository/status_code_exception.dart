import 'package:equatable/equatable.dart';

class ApiException implements Exception, Equatable {
  final ApiExceptionType statusCode;
  final String? message;

  ApiException({required this.statusCode, this.message});

  @override
  List<Object?> get props => [message, statusCode];

  @override
  bool? get stringify => true;
}

enum ApiExceptionType {
  none,
  connectionFailed,
  serverError,
  unauthenticated,
  badRequest
}
