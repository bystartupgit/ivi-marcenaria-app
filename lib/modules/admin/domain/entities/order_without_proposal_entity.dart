import 'package:marcenaria/modules/admin/domain/enum/order_status_enum.dart';
import 'package:marcenaria/modules/admin/domain/mappers/order_mapper.dart';

class OrderWithoutProposalEntity {
  final int id;
  final int customerID;
  final String title;
  final String description;
  final bool whatsapp;
  final String environments;

  final OrderStatus status;

  List<String> get listEnviroment => environments.split(',');

  OrderWithoutProposalEntity(
      {required this.id,
      required this.customerID,
      required this.title,
      this.description = "",
      this.whatsapp = false,
      required this.environments,
      required this.status});

  factory OrderWithoutProposalEntity.fromMap(Map<String, dynamic> map) =>
      OrderWithoutProposalEntity(
          id: map[OrderMapper.id],
          customerID: map[OrderMapper.customerID],
          title: map[OrderMapper.title],
          environments: map[OrderMapper.environments],
          whatsapp: map[OrderMapper.whatsapp],
          description: map[OrderMapper.description],
          status: StatusExtension.fromString(map[OrderMapper.status]));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is OrderWithoutProposalEntity) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}
