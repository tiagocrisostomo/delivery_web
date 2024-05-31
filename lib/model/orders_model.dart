class OrdersModel {
  final String client;
  final String product;
  final String hour;
  final String phone;
  final String price;

  OrdersModel({
    required this.client,
    required this.product,
    required this.hour,
    required this.phone,
    required this.price,
  });

  factory OrdersModel.fromMap(Map<String, dynamic> map) {
    return OrdersModel(
      client: map['client'],
      product: map['produc'],
      hour: map['hour'],
      phone: map['phone'],
      price: map['price'],
    );
  }
}
