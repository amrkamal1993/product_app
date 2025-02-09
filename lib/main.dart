import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_app/core/di/injection.dart';
import 'package:product_app/data/models/product.dart';
import 'package:product_app/presentation/cubit/theme_cubit.dart';
import 'package:product_app/presentation/screens/product_list_screen.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favoritesBox');
  Hive.registerAdapter(ProductModelAdapter());

  runApp(
    ScreenUtilInit(
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Product App',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          home: const ProductListScreen(),
        );
      },
    );
  }
}
