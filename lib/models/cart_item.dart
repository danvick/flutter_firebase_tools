import 'package:flutterreststarter/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

part 'cart_item.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  factory CartItem({
    Product product,
    int count,
  }) = _CartItem;

  @late
  double get subTotal => double.parse(product.cost) * count;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
