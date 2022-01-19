part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.apiExceptionType = ApiExceptionType.none,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final ApiExceptionType? apiExceptionType;
  final Username username;
  final Password password;

  LoginState copyWith({
    FormzStatus? status,
    ApiExceptionType? apiExceptionType,
    Username? username,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      apiExceptionType: apiExceptionType ?? this.apiExceptionType,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
