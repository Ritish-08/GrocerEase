import 'package:flutter/material.dart';
import 'package:grocery/data/cart_items.dart';
import 'package:grocery/features/cart/bloc/cart_bloc.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});
  final CartBloc cartBloc;

  @override
  State<CartTileWidget> createState() => _CartTileWidgetState();
}

class _CartTileWidgetState extends State<CartTileWidget> {
  var num = 1;
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
                            widget.cartBloc.add(CartRemoveFromCartEvent(productDataModel: widget.productDataModel),);
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
                      Container(
                        height: 20,
                        width: 72,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Center(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      num++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.teal.shade300,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.teal.shade300,
                              ),
                              child: Center(child: Text('${num}',style: TextStyle(color: Colors.white),)),
                            ),
                            Container(
                              child: Center(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if(num>1) {
                                        num--;
                                      }
                                      else{
                                        num = 1;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.teal.shade300,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
// Column(
// children: [
// Container(
// height: 200,
// width: double.maxFinite,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(productDataModel.imageUrl),
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(
// height: 20,
// ),
// Text(
// productDataModel.name,
// style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// ),
// Text(
// productDataModel.description,
// textAlign: TextAlign.center,
// ),
// Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// Text(
// 'Rs ${productDataModel.price.toString()}',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Colors.black),
// ),
// Row(
// children: [
// IconButton(
// onPressed: () {
// // homeBloc.add(HomeProductWishlistButtonClickedEvent(
// //     clickedProduct: productDataModel));
// },
// icon: Icon(
// Icons.favorite_border,
// color: Colors.black,
// ),
// ),
// IconButton(
// onPressed: () {
// // homeBloc.add(HomeProductCartButtonClickedEvent(
// //     clickedProduct: productDataModel));
// },
// icon: Icon(
// Icons.shopping_cart_checkout_outlined,
// ),
// ),
// IconButton(
// onPressed: () {
// cartBloc.add(CartRemoveFromCartEvent(
// productDataModel: productDataModel));
// },
// icon: Icon(Icons.close),
// )
// ],
// )
// ]),
// ],
// ),
