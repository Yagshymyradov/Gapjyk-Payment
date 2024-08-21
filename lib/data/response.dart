import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class AuthResponse {
  final int id;
  final String name;
  final String username;
  @JsonKey(name: 'access_token')
  final String accessToken;

  AuthResponse({
    required this.id,
    required this.name,
    required this.username,
    required this.accessToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}
