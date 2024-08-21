import 'json_http_client.dart';
import 'response.dart';

extension Endpoints on Never {
  static String get login => 'code-sellers/login';
}

class ApiClient {
  final JsonHttpClient _httpClient;

  ApiClient(this._httpClient);

  Future<AuthResponse> login(
    String username,
    String password,
  ) async {
    final postData = <String, dynamic>{
      'username': username,
      'password': password,
    };
    return _httpClient.post(
      Endpoints.login,
      body: postData,
      mapper: (dynamic data) => AuthResponse.fromJson(
        data['data'] as Map<String, dynamic>,
      ),
    );
  }
}
