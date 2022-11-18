import 'package:lunch_now/app/core/life_cycle/controller_life_cycle.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, ControllerLifeCycle {
  @override
  Future<void> onReady() async {
    await _hasRegisteredAddress();
  }

  Future<void> _hasRegisteredAddress() async {}
}
