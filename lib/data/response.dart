import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class AuthResponse {
  final int id;
  final String username;
  final String name;
  final int limit;
  final int sold;
  @JsonKey(name: 'total_sold')
  final int totalSold;
  final int percent;
  @JsonKey(name: 'seller_profit')
  final int sellerProfit;
  @JsonKey(name: 'admin_profit')
  final int adminProfit;
  @JsonKey(name: 'access_token')
  final String accessToken;

  AuthResponse({
    required this.id,
    required this.username,
    required this.name,
    required this.limit,
    required this.sold,
    required this.totalSold,
    required this.percent,
    required this.sellerProfit,
    required this.adminProfit,
    required this.accessToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}
