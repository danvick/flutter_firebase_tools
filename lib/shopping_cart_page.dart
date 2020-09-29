import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterreststarter/cubits/cart/cart_cubit.dart';

import 'models/cart.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart')),
      body: BlocBuilder<CartCubit, Cart>(
        builder: (_, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: state.items?.length ?? 0,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading:
                          Image.network(state.items[index].product.imageUrl),
                      title: Text('${state.items[index].product.name}'),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${state.items[index].product.cost}   x   ${state.items[index].count}',
                          ),
                          Text(
                            '${state.items[index].subTotal}',
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(CommunityMaterialIcons.cart_minus),
                        onPressed: () {
                          return BlocProvider.of<CartCubit>(context)
                              .removeItem(state.items[index]);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                ),
              ),
              Divider(thickness: 5),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '${state.total}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: RaisedButton(
                        child: Text('Proceed to checkout'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
