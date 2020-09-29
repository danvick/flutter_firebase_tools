import 'package:bloc/bloc.dart';
import 'package:flutterreststarter/models/cart_item.dart';
import 'package:flutterreststarter/models/models.dart';

class CartCubit extends Cubit<Cart> {
  CartCubit() : super(Cart(items: [], status: 'initial'));

  addItem(Product item) {
    var newList = [...state.items, CartItem(product: item, count: 1)];
    emit(state.copyWith(items: newList));
  }

  removeItem(CartItem item) {
    var newList = [...state.items..remove(item)];
    emit(state.copyWith(items: newList));
  }
}
