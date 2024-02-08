import 'package:flutter/material.dart';
import 'package:grocery/features/cart/bloc/cart_bloc.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});
  final CartBloc cartBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //   color: Colors.black.withOpacity(.4),
        //   width: 2,
        // )
      ),
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            productDataModel.description,
            textAlign: TextAlign.center,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Rs ${productDataModel.price.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                    //     clickedProduct: productDataModel));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // homeBloc.add(HomeProductCartButtonClickedEvent(
                    //     clickedProduct: productDataModel));
                  },
                  icon: Icon(
                    Icons.shopping_cart_checkout_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartBloc.add(CartRemoveFromCartEvent(
                        productDataModel: productDataModel));
                  },
                  icon: Icon(Icons.close),
                )
              ],
            )
          ]),
        ],
      ),
    );
  }
}
