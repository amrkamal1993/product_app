import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_app/presentation/cubit/product_cubit.dart';
import 'package:product_app/presentation/cubit/product_state.dart';
import 'package:product_app/presentation/cubit/theme_cubit.dart';
import 'package:product_app/presentation/screens/product_details_screen.dart';
import 'package:product_app/presentation/screens/favorites_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/presentation/widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, size: 24.sp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.dark_mode, size: 24.sp),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            GetIt.instance.get<ProductCubit>()..fetchProducts(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                  child: CircularProgressIndicator(strokeWidth: 2.5.w));
            } else if (state is ProductLoaded) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = MediaQuery.of(context).size.width;

                  int crossAxisCount = screenWidth > 600 ? 3 : 2;
                  double aspectRatio = screenWidth > 600 ? 0.85 : 0.75;

                  return GridView.builder(
                    padding: EdgeInsets.all(6.r),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 6.w,
                      mainAxisSpacing: 6.h,
                      childAspectRatio: aspectRatio,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(product: product),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            } else if (state is ProductError) {
              return Center(
                child: Text(
                  'Failed to load products',
                  style: TextStyle(fontSize: 16.sp, color: Colors.red),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
