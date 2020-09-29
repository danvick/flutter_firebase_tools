// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

class _$CartTearOff {
  const _$CartTearOff();

  _Cart call({List<CartItem> items, String status}) {
    return _Cart(
      items: items,
      status: status,
    );
  }
}

// ignore: unused_element
const $Cart = _$CartTearOff();

mixin _$Cart {
  List<CartItem> get items;
  String get status;

  Map<String, dynamic> toJson();
  $CartCopyWith<Cart> get copyWith;
}

abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res>;
  $Res call({List<CartItem> items, String status});
}

class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  final Cart _value;
  // ignore: unused_field
  final $Res Function(Cart) _then;

  @override
  $Res call({
    Object items = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed ? _value.items : items as List<CartItem>,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

abstract class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) then) =
      __$CartCopyWithImpl<$Res>;
  @override
  $Res call({List<CartItem> items, String status});
}

class __$CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(_Cart _value, $Res Function(_Cart) _then)
      : super(_value, (v) => _then(v as _Cart));

  @override
  _Cart get _value => super._value as _Cart;

  @override
  $Res call({
    Object items = freezed,
    Object status = freezed,
  }) {
    return _then(_Cart(
      items: items == freezed ? _value.items : items as List<CartItem>,
      status: status == freezed ? _value.status : status as String,
    ));
  }
}

@JsonSerializable()
class _$_Cart implements _Cart {
  _$_Cart({this.items, this.status});

  factory _$_Cart.fromJson(Map<String, dynamic> json) =>
      _$_$_CartFromJson(json);

  @override
  final List<CartItem> items;
  @override
  final String status;

  bool _didtotal = false;
  double _total;

  @override
  double get total {
    if (_didtotal == false) {
      _didtotal = true;
      _total = items.fold(
          0, (previousValue, element) => previousValue + element.subTotal);
    }
    return _total;
  }

  @override
  String toString() {
    return 'Cart(items: $items, status: $status, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Cart &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(status);

  @override
  _$CartCopyWith<_Cart> get copyWith =>
      __$CartCopyWithImpl<_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CartToJson(this);
  }
}

abstract class _Cart implements Cart {
  factory _Cart({List<CartItem> items, String status}) = _$_Cart;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  List<CartItem> get items;
  @override
  String get status;
  @override
  _$CartCopyWith<_Cart> get copyWith;
}
