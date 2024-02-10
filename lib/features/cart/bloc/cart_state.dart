part of 'cart_bloc.dart';

@immutable
sealed class CartState {}
final class CartInitial extends CartState {}
//yahan tak phela se
abstract class CartActionState extends CartEvent {}



class CartSuccessState extends CartState {
  //products which were carted
  final List<ProductDataModel> cartItems;
  CartSuccessState({required this.cartItems});
}
