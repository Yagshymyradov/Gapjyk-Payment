import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/api_client.dart';
import 'data/auth_controller.dart';
import 'data/json_http_client.dart';
import 'data/services/preferences.dart';

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

final apiBaseUrlProvider = Provider((ref) => 'http://216.250.8.149/api/v1/');

final httpClientProvider = Provider(
  (ref) {
    final httpClient = JsonHttpClient();

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
