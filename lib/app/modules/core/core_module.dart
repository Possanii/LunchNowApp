import 'package:flutter_modular/flutter_modular.dart';
import 'package:lunch_now/app/core/database/sqlite_connection_factory.dart';
import 'package:lunch_now/app/core/local_storage/flutter_secure_storage/flutter_storage_local_storage_impl.dart';
import 'package:lunch_now/app/core/local_storage/local_storage.dart';
import 'package:lunch_now/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:lunch_now/app/core/logger/app_logger.dart';
import 'package:lunch_now/app/core/logger/logger_app_logger_impl.dart';
import 'package:lunch_now/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:lunch_now/app/core/rest_client/rest_client.dart';
import 'package:lunch_now/app/modules/core/auth/auth_store.dart';
import 'package:lunch_now/app/repositories/address/address_repository.dart';
import 'package:lunch_now/app/repositories/address/address_repository_impl.dart';
import 'package:lunch_now/app/repositories/meal/meal_repository.dart';
import 'package:lunch_now/app/repositories/meal/meal_repository_impl.dart';
import 'package:lunch_now/app/repositories/supplier/supplier_repository.dart';
import 'package:lunch_now/app/repositories/supplier/supplier_repository_impl.dart';
import 'package:lunch_now/app/services/address/address_service.dart';
import 'package:lunch_now/app/services/address/address_service_impl.dart';
import 'package:lunch_now/app/services/meal/meal_service.dart';
import 'package:lunch_now/app/services/meal/meal_service_impl.dart';
import 'package:lunch_now/app/services/supplier/supplier_service.dart';
import 'package:lunch_now/app/services/supplier/supplier_service_impl.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => SqliteConnectionFactory(),
      export: true,
    ),
    Bind.lazySingleton<AppLogger>(
      (i) => LoggerAppLoggerImpl(),
      export: true,
    ),
    Bind.lazySingleton<RestClient>(
      (i) => DioRestClient(localStorage: i(), log: i(), authStore: i()),
      export: true,
    ),
    Bind.lazySingleton<LocalStorage>(
      (i) => SharedPreferencesLocalStorageImpl(),
      export: true,
    ),
    Bind.lazySingleton<LocalSecureStorage>(
      (i) => FlutterStorageLocalStorageImpl(),
      export: true,
    ),
    Bind.lazySingleton(
      (i) => AuthStore(localStorage: i()),
      export: true,
    ),
    Bind.lazySingleton<AddressService>(
      (i) => AddressServiceImpl(addressRepository: i(), localStorage: i()),
      export: true,
    ),
    Bind.lazySingleton<AddressRepository>(
      (i) => AddressRepositoryImpl(sqliteConnectionFactory: i()),
      export: true,
    ),
    Bind.lazySingleton<SupplierRepository>(
        (i) => SupplierRepositoryImpl(log: i(), restClient: i()),
        export: true),
    Bind.lazySingleton<SupplierService>(
      (i) => SupplierServiceImpl(repository: i()),
      export: true,
    ),
    Bind.lazySingleton<MealService>((i) => MealServiceImpl(mealRepository: i()),
        export: true),
    Bind.lazySingleton<MealRepository>(
      (i) => MealRepositoryImpl(restClient: i(), log: i()),
      export: true,
    ),
  ];
}
