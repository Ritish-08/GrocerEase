import 'package:flutter/material.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});
  final HomeBloc homeBloc;

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  bool forIcon = false;
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
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 14.0),
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.productDataModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.productDataModel.description,
            textAlign: TextAlign.center,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Rs ${widget.productDataModel.price.toString()}',
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
                    widget.homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        clickedProduct: widget.productDataModel));
                    setState(() {
                      forIcon = !forIcon;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: forIcon ? Colors.red.shade500 : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    widget.homeBloc.add(HomeProductCartButtonClickedEvent(
                      clickedProduct: widget.productDataModel,
                    ));
                  },
                  icon: Icon(Icons.shopping_cart_checkout),
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
