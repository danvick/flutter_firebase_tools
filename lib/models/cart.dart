import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'cart.freezed.dart';

part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  factory Cart({
    List<CartItem> items,
    String status,
}) = _Cart;

  @late
  double get total => items.fold(0, (previousValue, element) => previousValue + element.subTotal);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
