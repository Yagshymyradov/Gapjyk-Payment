// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      name: json['name'] as String,
      limit: (json['limit'] as num).toInt(),
      sold: (json['sold'] as num).toInt(),
      totalSold: (json['total_sold'] as num).toInt(),
      percent: (json['percent'] as num).toInt(),
      sellerProfit: (json['seller_profit'] as num).toInt(),
      adminProfit: (json['admin_profit'] as num).toInt(),
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'limit': instance.limit,
      'sold': instance.sold,
      'total_sold': instance.totalSold,
      'percent': instance.percent,
      'seller_profit': instance.sellerProfit,
      'admin_profit': instance.adminProfit,
      'access_token': instance.accessToken,
    };