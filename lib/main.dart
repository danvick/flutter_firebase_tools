import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutterreststarter/cubits/cart/cart_cubit.dart';
import 'package:flutterreststarter/cubits/products/products_cubit.dart';
import 'package:flutterreststarter/cubits/wish_list/wish_list_cubit.dart';
import 'package:get_it/get_it.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.I.registerSingleton<FirebaseAnalytics>(FirebaseAnalytics());
  if (kDebugMode) {
    Stetho.initialize();
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
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
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: GetIt.I<FirebaseAnalytics>())],
      home: HomePage(),
    );
  }
}
