import 'dart:io';

import 'package:marcenaria/modules/customer/home/service/domain/dto/service_dto.dart';

class ServiceUtils {
  static (String, bool) validateServiceInformation(ServiceDTO service) {
    if (service.name.trim().isEmpty) {
      return ("O nome do projeto não pode ser vázio.", false);
    }

    if (service.environments.isEmpty) {
      return (
        "Você deve selecionar ao menos um tipo de ambiente para continuar.",
        false
      );
    }

    return ("", true);
  }

  static (String, bool) validateServiceDetails(File? details) {
    if (details == null) {
      return (
        "O documento de referencia deve ser preenchido para salvar o orçamento.",
        false
      );
    }

    return ("", true);
  }
}
