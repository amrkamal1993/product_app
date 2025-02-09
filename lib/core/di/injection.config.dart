// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:product_app/data/repositories/product_repository_impl.dart'
    as _i955;
import 'package:product_app/data/sources/product_local_data_source.dart' as _i8;
import 'package:product_app/data/sources/product_remote_data_source.dart'
    as _i402;
import 'package:product_app/domain/repositories/product_repository.dart'
    as _i22;
import 'package:product_app/domain/usecases/get_favorites.dart' as _i478;
import 'package:product_app/domain/usecases/get_products.dart' as _i185;
import 'package:product_app/domain/usecases/toggle_favorite.dart' as _i600;
import 'package:product_app/presentation/cubit/favourite_cubit.dart' as _i1048;
import 'package:product_app/presentation/cubit/product_cubit.dart' as _i863;
import 'package:product_app/presentation/cubit/theme_cubit.dart' as _i1060;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1060.ThemeCubit>(() => _i1060.ThemeCubit());
    gh.lazySingleton<_i402.ProductRemoteDataSource>(
        () => _i402.ProductRemoteDataSourceImpl(gh<_i519.Client>()));
    gh.lazySingleton<_i8.ProductLocalDataSource>(
        () => _i8.ProductLocalDataSourceImpl(gh<_i979.Box<dynamic>>()));
    gh.lazySingleton<_i22.ProductRepository>(() => _i955.ProductRepositoryImpl(
          remoteDataSource: gh<_i402.ProductRemoteDataSource>(),
          localDataSource: gh<_i8.ProductLocalDataSource>(),
        ));
    gh.factory<_i185.GetProducts>(
        () => _i185.GetProducts(gh<_i22.ProductRepository>()));
    gh.factory<_i478.GetFavorites>(
        () => _i478.GetFavorites(gh<_i22.ProductRepository>()));
    gh.factory<_i600.ToggleFavorite>(
        () => _i600.ToggleFavorite(gh<_i22.ProductRepository>()));
    gh.factory<_i1048.FavouriteCubit>(() =>
        _i1048.FavouriteCubit(getFavoritesUseCase: gh<_i478.GetFavorites>()));
    gh.factory<_i863.ProductCubit>(() => _i863.ProductCubit(
          getProductsUseCase: gh<_i185.GetProducts>(),
          toggleFavoriteUseCase: gh<_i600.ToggleFavorite>(),
        ));
    return this;
  }
}
