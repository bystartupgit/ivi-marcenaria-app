


import 'package:marcenaria/modules/admin/domain/mappers/proposal_dto_mapper.dart';

class CreateProposalDTO {

  final int orderID;
  final String message;
  final double totalValue;
  final double pixValue;
  final double discountValue;
  final double? openingValue;
  final double? valueParcel;
  final int? parcels;
  final bool? temporal;
  final double? fromTo;
  final String? url;

  CreateProposalDTO({
    required this.orderID, required this.message,
    this.valueParcel,
    required this.totalValue, required this.pixValue, required this.discountValue,
    required this.openingValue, required this.parcels, required this.temporal,
    required this.fromTo, required this.url});

  toMap() => {
    ProposalDTOMapper.orderID: orderID,
    ProposalDTOMapper.message: message,
    ProposalDTOMapper.totalValue: totalValue,
    ProposalDTOMapper.pixValue: pixValue,
    ProposalDTOMapper.discountValue: discountValue,
    ProposalDTOMapper.openingValue: openingValue,
    ProposalDTOMapper.parcels: parcels,
    ProposalDTOMapper.temporal: temporal,
    ProposalDTOMapper.fromTo: fromTo,
    ProposalDTOMapper.parcelValue: valueParcel,
    ProposalDTOMapper.url: url
  }..removeWhere((k,v) => v == null);

}