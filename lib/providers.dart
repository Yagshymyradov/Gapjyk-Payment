import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/api_client.dart';
import 'data/auth_controller.dart';
import 'data/json_http_client.dart';
import 'data/services/preferences.dart';
import 'screens/splash_screen.dart';
import 'utils/navigation.dart';

/// It is an error to use this provider without overriding it's value.
final appPrefsServiceProvider = Provider<AppPrefsService>(
  (ref) => throw UnimplementedError("Can't use this provider without overriding it's value."),
);

final authControllerProvider = StateNotifierProvider<AuthController, UserState?>(
  (ref) {
    final appPrefs = ref.watch(appPrefsServiceProvider);
    final initialState = AuthController.initialState(appPrefs);
    return AuthController(appPrefs, initialState);
  },
  dependencies: [appPrefsServiceProvider],
);

final apiBaseUrlProvider = Provider((ref) => 'https://ybady.com.tm/api/v1/');

final httpClientProvider = Provider(
  (ref) {
    final httpClient = JsonHttpClient();

    httpClient.dio.interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final authToken = ref.read(authControllerProvider);
            try {
              if (authToken != null) {
                options.headers[HttpHeaders.authorizationHeader] =
                    'Bearer ${authToken.accessToken}';
              }
            } catch (e) {
              //ignored
            }
            handler.next(options);
          },
          onError: (error, handler) {
            final authToken = ref.read(authControllerProvider)?.accessToken;

            if (error.response?.statusCode == 401) {
              if (authToken == null) return;
              //NOTE: one account one device
              final context = rootNavigatorKey.currentContext;
              logout(context!);
            }
            return handler.next(error);
          },
        ),
      ],
    );

    ref.listen(
      apiBaseUrlProvider,
      (previous, next) {
        final apiBaseUrl = next;
        httpClient.dio.options.baseUrl = apiBaseUrl;
      },
      fireImmediately: true,
    );

    return httpClient;
  },
  dependencies: [
    apiBaseUrlProvider,
    authControllerProvider,
  ],
);

final apiClientProvider = Provider(
  (ref) => ApiClient(ref.watch(httpClientProvider)),
  dependencies: [httpClientProvider],
);

Future<void> logout(BuildContext context) async {
  final scope = ProviderScope.containerOf(context, listen: false);
  final prefs = scope.read(appPrefsServiceProvider);
  final authController = scope.read(authControllerProvider.notifier);

  await authController.signOut();
  await prefs.clear();

  if (context.mounted) {
    // ignore: unawaited_futures
    replaceRootScreen(context, const SplashScreen());
  }
}
