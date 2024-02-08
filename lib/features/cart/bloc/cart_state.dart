part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartEvent {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}
