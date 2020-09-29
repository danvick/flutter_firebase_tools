import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutterreststarter/cubits/cart/cart_cubit.dart';
import 'package:flutterreststarter/cubits/products/products_cubit.dart';
import 'package:flutterreststarter/cubits/wish_list/wish_list_cubit.dart';

import 'home_page.dart';

void main() {
  if (kDebugMode) {
    Stetho.initialize();
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductsCubit>(
        create: (_) => ProductsCubit()..fetchProducts(),
      ),
      BlocProvider<WishListCubit>(create: (_) => WishListCubit()),
      BlocProvider<CartCubit>(create: (_) => CartCubit()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST Starter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
