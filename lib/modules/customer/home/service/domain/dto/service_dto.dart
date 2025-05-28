import '../mappers/service_mapper.dart';

class ServiceDTO {
  final int customerID;
  final String name;
  final bool whatsapp;
  final String environments;
  final String description;

  ServiceDTO(
      {required this.customerID,
      required this.name,
      this.whatsapp = false,
      required this.environments,
      this.description = ""});

  toMap() => {
        ServiceMapper.customerID: customerID,
        ServiceMapper.name: name,
        ServiceMapper.whatsapp: whatsapp,
        ServiceMapper.environment: environments,
        ServiceMapper.description: description,
      };
}
