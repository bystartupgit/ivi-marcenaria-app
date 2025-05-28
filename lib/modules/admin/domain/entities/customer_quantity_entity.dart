import 'package:marcenaria/modules/admin/domain/mappers/customer_quantity_mapper.dart';

class CustomerQuantityEntity {
  final int accepted;
  final int finished;
  final int waitingProposal;
  final int waitingApproval;

  CustomerQuantityEntity(
      {this.accepted = 0,
      this.finished = 0,
      this.waitingProposal = 0,
      this.waitingApproval = 0});

  factory CustomerQuantityEntity.fromMap(Map<String, dynamic> map) =>
      CustomerQuantityEntity(
        accepted: map[CustomerQuantityMapper.accepted],
        finished: map[CustomerQuantityMapper.finished],
        waitingApproval: map[CustomerQuantityMapper.waitingApproval],
        waitingProposal: map[CustomerQuantityMapper.waitingProposal],
      );
}
