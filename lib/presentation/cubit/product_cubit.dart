import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/toggle_favorite.dart';
import 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProductsUseCase;
  final ToggleFavorite toggleFavoriteUseCase;

  ProductCubit({
    required this.getProductsUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(ProductInitial());

  void fetchProducts() async {
    emit(ProductLoading());
    try {
      final products = await getProductsUseCase();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Failed to load products"));
    }
  }

  void toggleFavorite(Product product) async {
    await toggleFavoriteUseCase(product);
  }
}
