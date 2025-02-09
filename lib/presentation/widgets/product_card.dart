import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_app/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding:  EdgeInsets.all(4.r),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Image.network(
                product.image,
                height: 85.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
               SizedBox(height: 2.h),
              Text(
                product.title,
                style:  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                '\$${product.price}',
                style:  TextStyle(fontSize: 12.sp, color: Colors.green),
              ),
            ],
          ),
        ),


      ),
    );
  }
}
