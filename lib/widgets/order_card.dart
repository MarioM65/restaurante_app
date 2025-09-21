import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // Calculate total from order items
    final double total = order.orderItems.fold(0.0, (sum, item) => sum + (item.quantity * item.unitPrice));
    final String itemsDescription = order.orderItems.map((item) => 'Product ID: ${item.productId} (x${item.quantity})').join(', ');

    Color statusColor;
    IconData statusIcon;

    switch (order.status) {
      case 'DELIVERED':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'CANCELED':
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        break;
      case 'PENDING':
      case 'PREPARING':
      case 'READY':
      case 'DELIVERING':
      default:
        statusColor = colorScheme.primary;
        statusIcon = Icons.local_shipping;
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation to order detail page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Detalhes do pedido: ${order.id}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido ${order.id}',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              Text('Itens: $itemsDescription', style: textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(
                'Total: R\$ ${total.toStringAsFixed(2)}',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status: ${order.status}',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                  Icon(statusIcon, color: statusColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
