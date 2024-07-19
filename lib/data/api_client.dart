import 'json_http_client.dart';

extension Endpoints on Never{
  static String get login => 'code-sellers/login';
}

class ApiClient{
  final JsonHttpClient _httpClient;

  ApiClient(this._httpClient);
}
