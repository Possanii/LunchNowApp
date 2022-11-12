import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/modules/core/auth/auth_store.dart';
import 'package:lunch_now/app/repositories/address/address_repository.dart';
import 'package:lunch_now/app/repositories/address/address_repository_impl.dart';
import 'package:lunch_now/app/services/address/address_service.dart';
import 'package:lunch_now/app/services/address/address_service_impl.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(), export: true),
    Bind.lazySingleton<AddressRepository>(
      (i) => AddressRepositoryImpl(),
      export: true,
    ),
    Bind.lazySingleton<AddressService>(
      (i) => AddressServiceImpl(addressRepository: i()),
      export: true,
    ),
  ];
}
