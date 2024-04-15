part of 'password_bloc.dart';

class PasswordState extends Equatable {
  AuthStatus status;
  String message;
  PasswordStatus passwordStatus;

  PasswordState({
    this.status = AuthStatus.initial,
    this.passwordStatus = PasswordStatus.initial,
    this.message = '',
  });

  PasswordState copyWith({
    AuthStatus? status,
    PasswordStatus? passwordStatus,
    String? message,
  }) =>
      PasswordState(
        message: message ?? this.message,
        passwordStatus: passwordStatus ?? this.passwordStatus,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status, message, passwordStatus];
}

enum AuthStatus {
  initial,
  authed,
  unAuthed,
}

enum PasswordStatus {
  initial,
  entered,
  verified,
  error,
}
