class OrderItem {
  final String productId;
  final int quantity;
  final double unitPrice;

  OrderItem({
    required this.productId,
    required this.quantity,
    required this.unitPrice,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'],
      quantity: json['quantity'],
      unitPrice: json['unitPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'unitPrice': unitPrice,
    };
  }
}

class Order {
  final String id;
  final String customerId;
  final String status;
  final List<OrderItem> orderItems;

  Order({
    required this.id,
    required this.customerId,
    required this.status,
    required this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['orderItems'] as List;
    List<OrderItem> orderItemsList = list.map((i) => OrderItem.fromJson(i)).toList();

    return Order(
      id: json['id'],
      customerId: json['customerId'],
      status: json['status'],
      orderItems: orderItemsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'status': status,
      'orderItems': orderItems.map((e) => e.toJson()).toList(),
    };
  }
}