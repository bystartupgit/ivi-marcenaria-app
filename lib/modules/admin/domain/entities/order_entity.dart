import '../enum/order_status_enum.dart';
import '../mappers/order_mapper.dart';

class OrderEntity {

  final int id;
  final String title;
  final String environments;

  final OrderStatus status;

  List<String> get listEnviroment => environments.split(',');

  OrderEntity({
    required this.id,
    required this.title,
    required this.environments,
    required this.status
  });

  factory OrderEntity.fromMap(Map<String,dynamic> map) =>
      OrderEntity(
          id: map[OrderMapper.id],
          title: map[OrderMapper.title],
          environments: map[OrderMapper.environments],
          status: StatusExtension.fromString(map[OrderMapper.status])
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is OrderEntity) { return id == other.id; }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}