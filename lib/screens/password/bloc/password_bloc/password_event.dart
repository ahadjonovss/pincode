part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();
}

class CheckAuthStateEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}

class RemoveErrorEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}

class EnterPasswordEvent extends PasswordEvent {
  String password;
  EnterPasswordEvent(this.password);

  @override
  List<Object?> get props => [password];
}

class VerifyPasswordEvent extends PasswordEvent {
  String password;
  VerifyPasswordEvent(this.password);

  @override
  List<Object?> get props => [password];
}
