class Payment {
  final String id;
  final String orderId;
  final String method;
  final double amount;
  final String status;

  Payment({
    required this.id,
    required this.orderId,
    required this.method,
    required this.amount,
    required this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      orderId: json['orderId'],
      method: json['method'],
      amount: json['amount'].toDouble(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'method': method,
      'amount': amount,
      'status': status,
    };
  }
}