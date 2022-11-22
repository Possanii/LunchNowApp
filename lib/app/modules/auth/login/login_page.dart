import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/ui/Icons/lunch_now_icons.dart';
import 'package:lunch_now/app/core/ui/extensions/size_screen_extension.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';
import 'package:lunch_now/app/core/ui/widgets/lunchnow_default_button.dart';
import 'package:lunch_now/app/core/ui/widgets/lunchnow_textform_field.dart';
import 'package:lunch_now/app/core/ui/widgets/messages.dart';
import 'package:lunch_now/app/core/ui/widgets/rounded_button_with_icon.dart';
import 'package:lunch_now/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

part 'widgets/login_form.dart';
part 'widgets/login_register_buttons.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
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
                    const _LoginForm(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _OrSeparator(),
                    const _LoginRegisterButtons(),
                  ],
                ))));
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'OU',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: context.primaryColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
      ],
    );
  }
}
