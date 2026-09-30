import 'package:flutter/foundation.dart';

import '../data/mock_product.dart';
import '../models/product_model.dart';


class ProductProvider extends ChangeNotifier {
  final List<Product> _products = mockProducts;

  String _query = '';
  String _category = 'All';

  String get query => _query;
  String get category => _category;

  List<Product> get products {
    final search = _query.toLowerCase().trim();

    return _products.where((product) {
      final matchesSearch =
          search.isEmpty ||
              product.name.toLowerCase().contains(search) ||
              product.category.toLowerCase().contains(search);

      final matchesCategory =
          _category == 'All' ||
              product.category == _category;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  void search(String value) {
    _query = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void clearFilters() {
    _query = '';
    _category = 'All';
    notifyListeners();
  }
}