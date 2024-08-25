import 'json_http_client.dart';
import 'response.dart';

extension Endpoints on Never {
  static String get login => 'code-sellers/login';

  static String get profile => 'code-sellers/profile';

  static String get subscription => 'delay-subscription';
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

  Future<SellerProfile> profile() async {
    return _httpClient.get(
      Endpoints.profile,
      mapper: (dynamic data) => SellerProfile.fromJson(
        data['data'] as Map<String, dynamic>,
      ),
    );
  }

  Future<void> subscription(
    String phone,
    int month,
  ) async {
    final postData = <String, dynamic>{
      'phone': phone,
      'months': month,
    };
    return _httpClient.post(
      Endpoints.subscription,
      body: postData,
      mapper: (dynamic data) {
        //ignore
      },
    );
  }
}
