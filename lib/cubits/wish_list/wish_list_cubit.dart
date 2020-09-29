import 'package:bloc/bloc.dart';
import 'package:flutterreststarter/models/product.dart';

class WishListCubit extends Cubit<List<Product>> {
  WishListCubit() : super([]);

  toggle(Product item) {
    var list = state;
    if(state.contains(item)){
      list = [...state..remove(item)];
    }else{
      list = [...state, item];
    }
    // print(list);
    emit(list);
  }
}
