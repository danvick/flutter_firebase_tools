import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutterreststarter/models/cart_item.dart';
import 'package:flutterreststarter/models/models.dart';
import 'package:get_it/get_it.dart';

class CartCubit extends Cubit<Cart> {
  CartCubit() : super(Cart(items: [], status: 'initial'));

  addItem(Product item) {
    var newList = [...state.items, CartItem(product: item, count: 1)];
    emit(state.copyWith(items: newList));
    GetIt.I<FirebaseAnalytics>().logAddToCart(itemId: '${item.id}', itemName: item.name, quantity: 1, itemCategory: 'all');
  }

  removeItem(CartItem item) {
    var newList = [...state.items..remove(item)];
    emit(state.copyWith(items: newList));
    GetIt.I<FirebaseAnalytics>().logRemoveFromCart(itemId: '${item.product.id}', itemName: item.product.name, quantity: 1, itemCategory: 'all');
  }
}
