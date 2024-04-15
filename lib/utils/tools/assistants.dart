import 'package:pincode/screens/password/bloc/password_bloc/password_bloc.dart';

String statusToString(PasswordStatus status, {String error = 'Error'}) {
  switch (status) {
    case PasswordStatus.initial:
      return "Enter New Password";
    case PasswordStatus.entered:
      return "Verify Password";
    case PasswordStatus.verified:
      return "Verified";
    case PasswordStatus.error:
      return error;
    default:
      return "Unknown Status";
  }
}
