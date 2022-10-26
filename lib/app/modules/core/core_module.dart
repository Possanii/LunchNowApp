import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/core/auth/auth_store.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(), export: true),
  ];
}
