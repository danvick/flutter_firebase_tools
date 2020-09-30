import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutterreststarter/models/models.dart';
import 'package:flutterreststarter/services/products_service.dart';
import 'package:get_it/get_it.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsStateInitial());

  fetchProducts() async {
    emit(ProductsStateLoading());
    try {
      var products = await ProductsService.getProducts();
      emit(ProductsStateLoaded(products));
      GetIt.I<FirebaseAnalytics>().logViewItemList(itemCategory: 'all');
    } catch (e) {
      FirebaseCrashlytics.instance.log(e);
      emit(ProductsStateFailed(e));
    }
  }
}
