import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pincode/screens/home/home_page.dart';
import 'package:pincode/screens/password/bloc/password_bloc/password_bloc.dart';
import 'package:pincode/screens/password/presentation/password_mixin.dart';
import 'package:pincode/service/local_storage_service.dart';
import 'package:pincode/utils/tools/assistants.dart';

class PasswordPage extends StatelessWidget with PasswordMixin {
  PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordBloc(),
      child: BlocConsumer<PasswordBloc, PasswordState>(
        listener: (context, state) {
          if (state.passwordStatus == PasswordStatus.verified) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(statusToString(state.passwordStatus)),
              actions: [
                IconButton(
                    onPressed: () async {
                      await LocalStorageService().clear();
                    },
                    icon: const Icon(Icons.clear))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.13,
                    width: MediaQuery.sizeOf(context).height * 0.13,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png'))),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  TextField(
                    onChanged: (value) {
                      if (value.length == 5) {
                        enterPassword(context, state.passwordStatus);
                      } else {
                        if (state.passwordStatus == PasswordStatus.error) {
                          context.read<PasswordBloc>().add(RemoveErrorEvent());
                        }
                      }
                    },
                    controller: controller,
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Visibility(
                    visible: state.passwordStatus == PasswordStatus.error,
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            enterPassword(context, state.passwordStatus);
                          },
                          child: const Text("Done")))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
