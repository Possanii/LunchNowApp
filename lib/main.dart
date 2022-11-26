import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/app_module.dart';
import 'package:lunch_now/app/app_widget.dart';
import 'package:lunch_now/app/core/ui/application_config.dart';

Future main() async {
  await ApplicationConfig().configureApp();
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
