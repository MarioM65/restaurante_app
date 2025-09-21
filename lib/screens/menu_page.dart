import 'package:flutter/material.dart';
import '../widgets/menu_item.dart';
import '../services/api_service.dart';
import '../models/product.dart';
import '../models/category.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Future<List<Product>> _productsFuture;
  late Future<List<Category>> _categoriesFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _productsFuture = _apiService.getProducts();
    _categoriesFuture = _apiService.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _productsFuture,
      builder: (context, productSnapshot) {
        if (productSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (productSnapshot.hasError) {
          return Center(child: Text('Error: ${productSnapshot.error}'));
        } else if (!productSnapshot.hasData || productSnapshot.data!.isEmpty) {
          return const Center(child: Text('No products found.'));
        } else {
          final List<Product> products = productSnapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return MenuItem(
                product: product,
              );
            },
          );
        }
      },
    );
  }
}
