enum OrderStatus { analysis, aproval, payment, production, finished, cancelado }

extension StatusExtension on OrderStatus {
  static OrderStatus fromString(String value) => switch (value) {
        "em analise" => OrderStatus.analysis,
        "aceito" => OrderStatus.aproval,
        "em execucao" => OrderStatus.production,
        "concluido" => OrderStatus.finished,
        "cancelado" => OrderStatus.cancelado,
        _ => OrderStatus.analysis
      };

  static String fromTitle(OrderStatus value) => switch (value) {
        OrderStatus.analysis => "Aguardando Orçamento",
        OrderStatus.aproval => "Aguardado Aprovação",
        OrderStatus.payment => "Pagamento",
        OrderStatus.cancelado => "Cancelado",
        OrderStatus.production => "Em produção",
        OrderStatus.finished => "Concluído"
      };
}
