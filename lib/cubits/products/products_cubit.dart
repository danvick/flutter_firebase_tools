import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterreststarter/models/models.dart';
import 'package:flutterreststarter/services/products_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsStateInitial());

  fetchProducts() async {
    emit(ProductsStateLoading());
    try {
      var products = await ProductsService.getProducts();
      emit(ProductsStateLoaded(products));
    } catch (e) {
      emit(ProductsStateFailed(e));
    }
  }
}
