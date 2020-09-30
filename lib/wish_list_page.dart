import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterreststarter/cubits/wish_list/wish_list_cubit.dart';
import 'package:flutterreststarter/models/models.dart';

class WishListPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Wish List')),
      body: BlocConsumer<WishListCubit, List<Product>>(
        listener: (_, __) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Item removed from your wishlist.')),);
        },
        listenWhen: (oldList, newList){
          return oldList != newList;
        },
        builder: (_, state) {
          return ListView.separated(
            itemCount: state.length,
            itemBuilder: (_, index) {
              return ListTile(
                leading: Image.network(state[index].imageUrl),
                title: Text('${state[index].name}'),
                subtitle: Text('${state[index].cost}'),
                trailing: IconButton(
                  icon: Icon(
                    CommunityMaterialIcons.star_remove,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {
                    return BlocProvider.of<WishListCubit>(context)
                        .toggle(state[index]);
                  },
                ),
              );
            },
            separatorBuilder: (_, __) => Divider(),
          );
        },
      ),
    );
  }
}
