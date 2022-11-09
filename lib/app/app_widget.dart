// ignore_for_file: deprecated_member_use

import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunch_now/app/core/ui/ui_config.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/auth');
    Modular.setObservers([asuka.asukaHeroController]);

    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp.router(
              title: UiConfig.title,
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return asuka.builder(context, child);
              },
              theme: UiConfig.theme,
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate);
        }); //added by extension
  }
}