import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:product_app/presentation/cubit/favourite_state.dart';
import '../../domain/usecases/get_favorites.dart';

@injectable
class FavouriteCubit extends Cubit<FavouriteState> {
  final GetFavorites getFavoritesUseCase;

  FavouriteCubit({
    required this.getFavoritesUseCase,
  }) : super(FavoriteInitial());

  void fetchFavorites() async {
    emit(FavoriteLoading());
    final favorites = await getFavoritesUseCase();
    emit(FavoriteLoaded(favorites));
  }
}
