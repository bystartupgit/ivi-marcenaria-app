import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/user_entity.dart';

class ConversationOrderEntity {
  final List<UserEntity> users;
  final OrderEntity order;

  ConversationOrderEntity({required this.users, required this.order});

  factory ConversationOrderEntity.fromMap(Map<String, dynamic> map) =>
      ConversationOrderEntity(
          users: List.from(map["usuarios"])
              .map((e) => UserEntity.fromMap(e))
              .toList(),
          order: OrderEntity.fromMap(map["pedido"]));
}
