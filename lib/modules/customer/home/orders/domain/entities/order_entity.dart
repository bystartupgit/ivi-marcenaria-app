


import 'package:marcenaria/modules/customer/home/orders/domain/enum/order_status_enum.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_mapper.dart';

class OrderEntity {

  final int id;
  final int customerID;
  final String title;
  final String description;
  final bool whatsapp;
  final String environments;

  final OrderStatus status;

  OrderEntity({
    required this.id,
    required this.customerID,
    required this.title,
    this.description = "",
    this.whatsapp = false,
    required this.environments,
    required this.status
  });

  factory OrderEntity.fromMap(Map<String,dynamic> map) =>
      OrderEntity(
          id: map[OrderMapper.id],
          customerID: map[OrderMapper.customerID],
          title: map[OrderMapper.title],
          environments: map[OrderMapper.environments],
          whatsapp: map[OrderMapper.whatsapp],
          description: map[OrderMapper.description],
          status: map[OrderMapper.status]
      );
}