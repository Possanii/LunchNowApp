import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/life_cycle/controller_life_cycle.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, ControllerLifeCycle {
  // @override
  // void onInit([Map<String, dynamic>? params]) {
  //   print('onInit chamado');
  // }

  @override
  Future<void> onReady() async {
    await _hasRegisteredAddress();
  }

  Future<void> _hasRegisteredAddress() async {
    await Modular.to.pushNamed('/address/');
  }
}
