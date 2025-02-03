


import 'package:marcenaria/core/data/enums/order_status_enum.dart';

class OrderEntity {

  final int id;
  final String title;
  final String cover;
  final List<String> environments;
  final double amount;

  final DateTime date;
  final OrderStatus status;

  OrderEntity({ this.id = 0, required this.title,
    this.cover = "", this.amount = 0.0, required this.date,
    this.environments = const [], this.status = OrderStatus.requested
  });



}