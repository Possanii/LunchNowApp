import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/ui/extensions/size_screen_extension.dart';
import 'package:lunch_now/app/core/ui/widgets/lunchnow_default_button.dart';
import 'package:lunch_now/app/core/ui/widgets/lunchnow_textform_field.dart';
import 'package:lunch_now/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuário'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 162.w,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const _RegisterForm(),
        ],
      )),
    );
  }
}
