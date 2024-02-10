part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

abstract class WishListActionState extends WishlistState{}

class WishListSuccessState extends WishlistState{
  final List<ProductDataModel> WishListItems;

  WishListSuccessState({required this.WishListItems});
}

