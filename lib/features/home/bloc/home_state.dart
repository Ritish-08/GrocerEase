part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
//yahan tak phela se

//actionable state rebuilds with changes like clicking on wishlist navigates to other pages, ye khud linkhi hai
abstract class HomeActionState extends HomeState {}

//showing circular progress indicator while data fetched from api for home screen and it is ui building so home state
class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  //need to pass products on load
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products}) {
    print('HomeLoadedSuccessState created with products: $products');
  }
}

//some error occured while loading homepage as soon you open your app
class HomeErrorState extends HomeState {}

//HOMEACTIONSTATE As we need to rebuild or create action or changes in ui
class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
