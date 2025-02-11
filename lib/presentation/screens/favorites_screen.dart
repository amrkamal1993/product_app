import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/presentation/cubit/favourite_cubit.dart';
import 'package:product_app/presentation/cubit/favourite_state.dart';
import 'package:product_app/presentation/widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => GetIt.instance.get<FavouriteCubit>()..fetchFavorites(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorites',
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        body: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is FavoriteLoaded) {
              if (state.favorites.isEmpty) {
                return Center(
                  child: Text(
                    'No favorites yet.',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ProductCard(product: state.favorites[index]),
                  );
                },
              );
            }
            if (state is FavoriteLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
