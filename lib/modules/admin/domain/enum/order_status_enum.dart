enum OrderStatus { analysis, aproval, payment, production, finished }

extension StatusExtension on OrderStatus {

  static OrderStatus fromString(String value) => switch(value) {
    "em analise" => OrderStatus.analysis,
    "aceito" => OrderStatus.aproval,
    _ => OrderStatus.analysis
  };

  static String fromTitle(OrderStatus value) => switch(value) {
    OrderStatus.analysis => "Aguardando Orçamento",
    OrderStatus.aproval => "Aguardado Aprovação",
    OrderStatus.payment => "Pagamento",
    OrderStatus.production => "Em produção",
    OrderStatus.finished => "Concluído"
  };
}