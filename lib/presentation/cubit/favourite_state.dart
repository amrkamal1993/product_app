import '../../domain/entities/product.dart';

abstract class FavouriteState {}

class FavoriteInitial extends FavouriteState {}

class FavoriteLoading extends FavouriteState {}

class FavoriteLoaded extends FavouriteState {
  final List<Product> favorites;

  FavoriteLoaded(this.favorites);
}

class FavoriteError extends FavouriteState {
  final String message;

  FavoriteError(this.message);
}
