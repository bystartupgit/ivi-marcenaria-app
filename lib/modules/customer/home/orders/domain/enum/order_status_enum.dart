

enum OrderStatus { analysis, appoval, payment, production, finished }

extension StatusExtension on OrderStatus {

  static OrderStatus fromString(String value) => switch(value) {
    "em analise" => OrderStatus.analysis,
    _ => OrderStatus.analysis
  };

  static String fromTitle(OrderStatus value) => switch(value) {
    OrderStatus.analysis => "Aguardando Orçamento",
    OrderStatus.appoval => "Aguardado Aprovação",
    OrderStatus.payment => "Pagamento",
    OrderStatus.production => "Em produção",
    OrderStatus.finished => "Concluído"
  };
}