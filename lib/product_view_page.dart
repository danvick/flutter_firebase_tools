import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'cubits/cart/cart_cubit.dart';
import 'models/models.dart';

class ProductViewPage extends StatefulWidget {
  final Product product;

  const ProductViewPage({Key key, @required this.product}) : super(key: key);

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  @override
  void initState() {
    GetIt.I<FirebaseAnalytics>().logViewItem(
        itemId: '${widget.product.id}',
        itemName: widget.product.name,
        price: double.parse(widget.product.cost),
        quantity: 1,
        itemCategory: 'all');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.product.name}'),
      ),
      body: Column(
        children: [
          Image.network(widget.product.imageUrl),
          Text(widget.product.name),
          Text(widget.product.cost),
        ],
      ),
      floatingActionButton: BlocBuilder<CartCubit, Cart>(
        builder: (_, cartState) => FloatingActionButton.extended(
          // child: Icon(CommunityMaterialIcons.cart_plus),
          icon: Icon(CommunityMaterialIcons.cart_plus),
          label: Text('${cartState.total}'),
          onPressed: () {
            BlocProvider.of<CartCubit>(context)
                .addItem(widget.product);
          },
        ),
      ),
    );
  }
}
