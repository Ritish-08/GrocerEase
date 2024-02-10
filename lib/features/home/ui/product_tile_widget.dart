import 'package:flutter/material.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget(
      {super.key, required this.productDataModel});


  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  HomeBloc homeBloc = HomeBloc();
  bool forIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.teal.shade300,
                        duration: Duration(milliseconds: 500),
                        content: Text('Item added in cart succesfully'),
                      ),
                    );
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        clickedProduct: widget.productDataModel));
                    setState(() {
                      forIcon = !forIcon;
                    });
                   },
                  icon: Icon(
                    Icons.favorite_border,
                    color: forIcon ? Colors.red.shade500 : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 500),
                        backgroundColor: Colors.green,
                        content: Text('Item wishlisted Succesfully'),
                      ),
                    );
                    homeBloc.add(HomeProductCartButtonClickedEvent(
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
