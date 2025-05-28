enum OrderStatus { requested, interested, start, production, completed }

extension Type on OrderStatus {
  String get name => switch (this) {
        OrderStatus.requested => "Serviço solicitado",
        OrderStatus.interested => "Sinalizar interesse",
        OrderStatus.start => "Iniciar produção",
        OrderStatus.production => "Em Produção",
        OrderStatus.completed => "Concluído"
      };

  int get index => switch (this) {
        OrderStatus.requested => 0,
        OrderStatus.interested => 1,
        OrderStatus.start => 2,
        OrderStatus.production => 3,
        OrderStatus.completed => 4
      };
}
