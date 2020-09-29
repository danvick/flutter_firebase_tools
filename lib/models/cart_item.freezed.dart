// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

class _$CartItemTearOff {
  const _$CartItemTearOff();

  _CartItem call({Product product, int count}) {
    return _CartItem(
      product: product,
      count: count,
    );
  }
}

// ignore: unused_element
const $CartItem = _$CartItemTearOff();

mixin _$CartItem {
  Product get product;
  int get count;

  Map<String, dynamic> toJson();
  $CartItemCopyWith<CartItem> get copyWith;
}

abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res>;
  $Res call({Product product, int count});

  $ProductCopyWith<$Res> get product;
}

class _$CartItemCopyWithImpl<$Res> implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  final CartItem _value;
  // ignore: unused_field
  final $Res Function(CartItem) _then;

  @override
  $Res call({
    Object product = freezed,
    Object count = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed ? _value.product : product as Product,
      count: count == freezed ? _value.count : count as int,
    ));
  }

  @override
  $ProductCopyWith<$Res> get product {
    if (_value.product == null) {
      return null;
    }
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

abstract class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) then) =
      __$CartItemCopyWithImpl<$Res>;
  @override
  $Res call({Product product, int count});

  @override
  $ProductCopyWith<$Res> get product;
}

class __$CartItemCopyWithImpl<$Res> extends _$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(_CartItem _value, $Res Function(_CartItem) _then)
      : super(_value, (v) => _then(v as _CartItem));

  @override
  _CartItem get _value => super._value as _CartItem;

  @override
  $Res call({
    Object product = freezed,
    Object count = freezed,
  }) {
    return _then(_CartItem(
      product: product == freezed ? _value.product : product as Product,
      count: count == freezed ? _value.count : count as int,
    ));
  }
}

@JsonSerializable()
class _$_CartItem implements _CartItem {
  _$_CartItem({this.product, this.count});

  factory _$_CartItem.fromJson(Map<String, dynamic> json) =>
      _$_$_CartItemFromJson(json);

  @override
  final Product product;
  @override
  final int count;

  bool _didsubTotal = false;
  double _subTotal;

  @override
  double get subTotal {
    if (_didsubTotal == false) {
      _didsubTotal = true;
      _subTotal = double.parse(product.cost) * count;
    }
    return _subTotal;
  }

  @override
  String toString() {
    return 'CartItem(product: $product, count: $count, subTotal: $subTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CartItem &&
            (identical(other.product, product) ||
                const DeepCollectionEquality()
                    .equals(other.product, product)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(product) ^
      const DeepCollectionEquality().hash(count);

  @override
  _$CartItemCopyWith<_CartItem> get copyWith =>
      __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CartItemToJson(this);
  }
}

abstract class _CartItem implements CartItem {
  factory _CartItem({Product product, int count}) = _$_CartItem;

  factory _CartItem.fromJson(Map<String, dynamic> json) = _$_CartItem.fromJson;

  @override
  Product get product;
  @override
  int get count;
  @override
  _$CartItemCopyWith<_CartItem> get copyWith;
}
