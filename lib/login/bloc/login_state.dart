part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.validated = false,
    this.submissionStatus = FormzSubmissionStatus.initial,
    this.apiExceptionType = ApiExceptionType.none,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  final bool validated;
  final FormzSubmissionStatus submissionStatus;
  final ApiExceptionType? apiExceptionType;
  final Username username;
  final Password password;

  LoginState copyWith({
    bool? validated,
    FormzSubmissionStatus? submissionStatus,
    ApiExceptionType? apiExceptionType,
    Username? username,
    Password? password,
  }) {
    return LoginState(
      validated: validated ?? this.validated,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      apiExceptionType: apiExceptionType ?? this.apiExceptionType,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [validated, submissionStatus, username, password];
}
