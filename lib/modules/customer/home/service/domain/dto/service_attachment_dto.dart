import '../mappers/service_attachment_mapper.dart';

class ServiceAttachmentDTO {
  final String name;
  final String type;
  final String path;
  final int customerID;
  final int orderID;
  final bool isCover;
  final String description;

  ServiceAttachmentDTO(
      {required this.name,
      required this.type,
      required this.path,
      required this.customerID,
      required this.orderID,
      this.isCover = false,
      required this.description});

  toMap() => {
        ServiceAttachmentMapper.name: name,
        ServiceAttachmentMapper.type: type,
        ServiceAttachmentMapper.path: path,
        ServiceAttachmentMapper.customerID: customerID,
        ServiceAttachmentMapper.orderID: orderID,
        ServiceAttachmentMapper.isCover: isCover,
        ServiceAttachmentMapper.description: description,
      };

  ServiceAttachmentDTO copyWith(String? path) => ServiceAttachmentDTO(
      name: name,
      type: type,
      path: path ?? this.path,
      customerID: customerID,
      orderID: orderID,
      description: description);
}
