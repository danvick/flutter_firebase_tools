// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$_$_CartItemFromJson(Map<String, dynamic> json) {
  return _$_CartItem(
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$_$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'product': instance.product,
      'count': instance.count,
    };
