import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppAPIService {
  static const String baseUrl = "https://fakestoreapi.com/";

  late final Dio dio;

  AppAPIService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  Future<List<dynamic>> getProducts() async {
    try {
      final response = await dio.get('products');
      
      if (response.statusCode == 200 && response.data is List) {
        return response.data;
      }

      return [];
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }
  Future<bool> createProduct(Map<String, dynamic> product) async {
    try {
      final response = await dio.post(
        'products',
        data: product,
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("Error creating product: $e");
      return false;
    }
  }
}