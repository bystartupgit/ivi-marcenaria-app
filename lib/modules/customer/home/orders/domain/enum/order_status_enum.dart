enum OrderStatus { analysis, appoval, payment, production, finished }

extension StatusExtension on OrderStatus {
  static OrderStatus fromString(String value) => switch (value) {
        "em analise" => OrderStatus.analysis,
        "em negociacao" => OrderStatus.appoval,
        "em execucao" => OrderStatus.production,
        _ => OrderStatus.analysis
      };

  static String fromTitle(OrderStatus value) => switch (value) {
        OrderStatus.analysis => "Aguardando Orçamento",
        OrderStatus.appoval => "Aguardado Aprovação",
        OrderStatus.payment => "Pagamento",
        OrderStatus.production => "Em produção",
        OrderStatus.finished => "Concluído"
      };

  static int fromStep(OrderStatus value) => switch (value) {
        OrderStatus.analysis => 0,
        OrderStatus.appoval => 1,
        OrderStatus.payment => 2,
        OrderStatus.production => 3,
        OrderStatus.finished => 4
      };
}
