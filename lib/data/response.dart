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

@JsonSerializable()
class SellerProfile {
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

  SellerProfile({
    required this.id,
    required this.username,
    required this.name,
    required this.limit,
    required this.sold,
    required this.totalSold,
    required this.percent,
    required this.sellerProfit,
    required this.adminProfit,
  });

  factory SellerProfile.fromJson(Map<String, dynamic> json) => _$SellerProfileFromJson(json);
}
