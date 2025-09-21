import 'package:flutter/material.dart';
import '../models/product.dart';

class MenuItem extends StatelessWidget {
  final Product product;

  const MenuItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation to product detail page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Detalhes do produto: ${product.name}')),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://placehold.co/600x400/orange/white?text=${product.name}', // Placeholder image
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(product.description, style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700])),
                  const SizedBox(height: 12),
                  Text(
                    'R\$ ${product.price.toStringAsFixed(2)}',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
