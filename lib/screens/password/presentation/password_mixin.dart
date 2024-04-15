import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pincode/screens/password/bloc/password_bloc/password_bloc.dart';

mixin PasswordMixin {
  TextEditingController controller = TextEditingController();

  void enterPassword(BuildContext context, PasswordStatus status) {
    if (status == PasswordStatus.initial) {
      context.read<PasswordBloc>().add(EnterPasswordEvent(controller.text));
      controller.clear();
    } else {
      context.read<PasswordBloc>().add(VerifyPasswordEvent(controller.text));
    }
  }
}
