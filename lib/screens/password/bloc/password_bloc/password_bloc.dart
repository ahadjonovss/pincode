import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pincode/screens/password/data/repository/password_repository.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordState()) {
    on<EnterPasswordEvent>(enterPassword);
    on<VerifyPasswordEvent>(verifyPassword);
    on<CheckAuthStateEvent>(checkAuthStatus);
    on<RemoveErrorEvent>(removeError);
    add(CheckAuthStateEvent());
  }

  PasswordRepository repository = PasswordRepository();

  String password = '';

  Future<void> checkAuthStatus(
      CheckAuthStateEvent event, Emitter<PasswordState> emit) async {
    String? password = await repository.getPassword();
    AuthStatus status =
        password == null ? AuthStatus.unAuthed : AuthStatus.authed;
    PasswordStatus passwordStatus = status == AuthStatus.authed
        ? PasswordStatus.entered
        : PasswordStatus.initial;
    emit(state.copyWith(status: status, passwordStatus: passwordStatus));
  }

  Future<void> enterPassword(
      EnterPasswordEvent event, Emitter<PasswordState> emit) async {
    password = event.password;
    emit(state.copyWith(passwordStatus: PasswordStatus.entered));
  }

  Future<void> verifyPassword(
      VerifyPasswordEvent event, Emitter<PasswordState> emit) async {
    String pswFromStorage = state.status == AuthStatus.authed
        ? (await repository.getPassword()) ?? ''
        : password;

    print("Auth Status ${state.status}");

    print("New password ${event.password} and Old $pswFromStorage");

    if (pswFromStorage == event.password) {
      await repository.setPassword(event.password);

      emit(state.copyWith(passwordStatus: PasswordStatus.verified));
    } else {
      emit(state.copyWith(
          passwordStatus: PasswordStatus.error, message: 'Incorrect password'));
    }
  }

  void removeError(RemoveErrorEvent event, Emitter<PasswordState> emit) {
    emit(state.copyWith(passwordStatus: PasswordStatus.entered, message: ''));
  }
}
