import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutterreststarter/models/product.dart';
import 'package:get_it/get_it.dart';

class WishListCubit extends Cubit<List<Product>> {
  WishListCubit() : super([]);

  toggle(Product item) {
    var list = state;
    if (state.contains(item)) {
      list = [...state..remove(item)];
      GetIt.I<FirebaseAnalytics>().logEvent(
          name: 'removeFromWishlist',
          parameters: {
            'itemId': '${item.id}',
            'itemName': item.name,
            'itemCategory': 'all'
          });
    } else {
      list = [...state, item];
      GetIt.I<FirebaseAnalytics>().logAddToWishlist(
          itemId: '${item.id}',
          itemName: item.name,
          quantity: 1,
          itemCategory: 'all');
    }
    // print(list);
    emit(list);
  }
}
