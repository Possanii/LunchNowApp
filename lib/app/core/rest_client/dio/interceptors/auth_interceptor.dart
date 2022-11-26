// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:dio/dio.dart';
import 'package:lunch_now/app/core/helpers/constants.dart';

import 'package:lunch_now/app/core/local_storage/local_storage.dart';
import 'package:lunch_now/app/core/logger/app_logger.dart';
import 'package:lunch_now/app/modules/core/auth/auth_store.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;
  final AppLogger _log;
  final AuthStore _authStore;
  AuthInterceptor({
    required LocalStorage localStorage,
    required AppLogger log,
    required AuthStore authStore,
  })  : _localStorage = localStorage,
        _log = log,
        _authStore = authStore;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired =
        options.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] ?? false;

    if (authRequired) {
      final accessToken = await _localStorage
          .read<String>(Constants.REST_CLIENT_AUTH_REQUIRED_KEY);

      if (accessToken == null) {
        _authStore.logout();
        return handler.reject(DioError(
          requestOptions: options,
          error: 'Expire Token',
          type: DioErrorType.cancel,
        ));
      }

      options.headers['idu'] = accessToken;
    } else {
      options.headers.remove('idu');
    }

    handler.next(options);
  }
}
