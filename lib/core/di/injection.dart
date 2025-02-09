import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:product_app/core/di/injection.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => sl.init();
