import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterreststarter/cubits/cart/cart_cubit.dart';
import 'package:flutterreststarter/cubits/products/products_cubit.dart';
import 'package:flutterreststarter/cubits/wish_list/wish_list_cubit.dart';
import 'package:flutterreststarter/models/models.dart';
import 'package:flutterreststarter/product_view_page.dart';
import 'package:flutterreststarter/shopping_cart_page.dart';
import 'package:flutterreststarter/wish_list_page.dart';

import 'models/product.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishListCubit = BlocProvider.of<WishListCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: [
          IconButton(
            icon: Icon(Icons.stars),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => WishListPage(),
                  settings: RouteSettings(name: '/wishlist'),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ShoppingCartPage(),
                  settings: RouteSettings(name: '/cart'),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsStateLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Image.network(
                                state.products[index].imageUrl,
                                fit: BoxFit.contain,
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ProductViewPage(
                                      product: state.products[index],
                                    ),
                                    settings: RouteSettings(
                                      name:
                                          '/products/${state.products[index].id}',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${state.products[index].name ?? ''}',
                                      overflow: TextOverflow.clip,
                                    ),
                                    Text(
                                      '${state.products[index].cost ?? ''}',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                ),
                              ),
                              BlocBuilder<CartCubit, Cart>(
                                builder: (_, cartState) => IconButton(
                                  icon: Icon(CommunityMaterialIcons.cart_plus),
                                  onPressed: () {
                                    BlocProvider.of<CartCubit>(context)
                                        .addItem(state.products[index]);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    BlocConsumer<WishListCubit, List<Product>>(
                      listener: (_, __) {
                        print('Updated');
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Your wishlist has been updated')),
                        );
                      },
                      listenWhen: (oldList, newList) {
                        return oldList != newList;
                      },
                      builder: (_, wishList) => IconButton(
                        icon: Icon(
                          wishList.contains(state.products[index])
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          wishListCubit.toggle(state.products[index]);
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }
          if (state is ProductsStateFailed) {
            return Center(
              child: Text(state.err.toString()),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
