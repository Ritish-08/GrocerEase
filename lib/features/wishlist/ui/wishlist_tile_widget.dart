import 'package:flutter/material.dart';
import 'package:grocery/data/wishlist_items.dart';
import 'package:grocery/features/cart/bloc/cart_bloc.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';
import 'package:grocery/features/wishlist/bloc/wishlist_bloc.dart';

class WishListTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  const WishListTileWidget({super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  State<WishListTileWidget> createState() => _WishListTileWidgetState();
}

class _WishListTileWidgetState extends State<WishListTileWidget> {
  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black.withOpacity(.8),
            width: 1,
          )),
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: 80,
              child: Image(
                image: NetworkImage(widget.productDataModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productDataModel.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            widget.wishlistBloc.add(WishListRemoveFromWishlistEvent(productDataModel: widget.productDataModel),);
                          });
                        },
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  Text(widget.productDataModel.description),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs. ${widget.productDataModel.price.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            duration: Duration(milliseconds: 500),
                            content: Text('Item added in cart succesfully'),

                          ));
                            homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: widget.productDataModel));

                        },
                          child: Icon(Icons.shopping_cart_checkout_outlined),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
