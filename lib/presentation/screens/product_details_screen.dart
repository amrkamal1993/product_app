import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/domain/entities/product.dart';
import 'package:product_app/presentation/cubit/product_cubit.dart';
import 'package:product_app/presentation/cubit/product_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<ProductCubit>(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title, style: TextStyle(fontSize: 20.sp)),
            ),
            body: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Image.network(
                  product.image,
                  height: 300.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 12.h),
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6.h),
                Text(
                  '\$${product.price}',
                  style: TextStyle(fontSize: 18.sp, color: Colors.green),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Category: ${product.category}',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(height: 12.h),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 12.h),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<ProductCubit>().toggleFavorite(product);
                  },
                  icon: Icon(Icons.favorite, size: 20.sp),
                  label: Text(
                    'Add to Favorites',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
