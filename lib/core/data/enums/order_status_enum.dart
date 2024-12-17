


enum OrderStatus { requested, interested, start, production, completed }

extension Type on OrderStatus {

  String get name => switch(this) {
    OrderStatus.requested => "Serviço solicitado",
    OrderStatus.interested => "Sinalizar interesse",
    OrderStatus.start => "Iniciar produção",
    OrderStatus.production => "Em Produção",
    OrderStatus.completed => "Concluído"
  };

}