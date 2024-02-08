import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/cart/ui/cart_page.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/ui/product_tile_widget.dart';
import 'package:grocery/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 500),
              backgroundColor: Colors.green,
              content: Text('Item wishlisted Succesfully'),
            ),
          );
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.teal.shade300,
              duration: Duration(milliseconds: 500),
              content: Text('Item added in cart succesfully'),
            ),
          );
        }
      },
      //tab call hoega jab buildwhen hoega tabhi builder call hoega that is! HomeActionState
      builder: (context, state) {
        print('Current State: $state');
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.teal.shade500,
                title: Text(
                  'Pick&Go',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_cart_checkout),
                  ),
                ],
              ),
              body: Container(
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                        productDataModel: successState.products[index],
                        homeBloc: homeBloc,
                      );
                    }),
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Cant be loaded'),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
