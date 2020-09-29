part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsStateInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsStateLoading extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsStateLoaded extends ProductsState {
  final List<Product> products;

  ProductsStateLoaded(this.products);
  @override
  List<Object> get props => [products];
}

class ProductsStateFailed extends ProductsState {
  final Error err;

  ProductsStateFailed(this.err);
  @override
  List<Object> get props => [err];
}


