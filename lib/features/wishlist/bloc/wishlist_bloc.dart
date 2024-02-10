import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:grocery/data/wishlist_items.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishlistInitialEvent);
    on<WishListRemoveFromWishlistEvent>(wishListRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishListSuccessState(WishListItems: wishlistItems));
  }

  FutureOr<void> wishListRemoveFromWishlistEvent(WishListRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishListSuccessState(WishListItems: wishlistItems));
  }
}
