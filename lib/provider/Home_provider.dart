import 'package:flutter/material.dart';
import '../models/product_modle.dart';
import '../services/product_service.dart';

class HomeProvider with ChangeNotifier {
  final AppAPIService _service = AppAPIService();

  bool isLoading = false;
  List<Products> posts = [];
  String? errorMessage;


  Future<void> fetchPosts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final fetched = await _service.getProducts();

      if (fetched.isEmpty) {
        posts = [];
        errorMessage = "لم يتم الحصول على المنتجات";
      } else {
        posts = fetched.map((e) => Products.fromJson(e)).toList();
      }

    } catch (e) {
      posts = [];
      errorMessage = "حدث خطأ أثناء تحميل البيانات";
      print("HomeProvider Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
