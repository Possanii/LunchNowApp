import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/app_module.dart';
import 'package:lunch_now/app/app_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
