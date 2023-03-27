import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/login/model/models.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      validated: Formz.validate([state.password, username]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      validated: Formz.validate([password, state.username]),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.validated) {
      emit(state.copyWith(submissionStatus: FormzSubmissionStatus.inProgress));
      try {
        //login using authentication repository, will notify
        //authentication bloc which will take care of navigation
        await _authenticationRepository.logIn(
          username: state.username.value,
          password: state.password.value,
        );
        emit(state.copyWith(submissionStatus: FormzSubmissionStatus.success));
      } on ApiException catch (e) {
        emit(state.copyWith(
            submissionStatus: FormzSubmissionStatus.failure,
            apiExceptionType: e.statusCode));
      } catch (_) {
        emit(state.copyWith(submissionStatus: FormzSubmissionStatus.failure));
      }
    }
  }
}
