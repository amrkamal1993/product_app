import 'package:mockito/annotations.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:product_app/data/sources/product_local_data_source.dart';
import 'package:product_app/data/sources/product_remote_data_source.dart';

@GenerateMocks([Box, ProductLocalDataSource, ProductRemoteDataSource, http.Client])
void main() {}
