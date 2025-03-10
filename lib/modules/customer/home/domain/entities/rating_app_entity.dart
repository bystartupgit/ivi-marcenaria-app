class RatingAPPEntity {

  final int customerID;
  final int orderID;
  final int rating;
  final String comment;

  RatingAPPEntity({required this.customerID, required this.orderID,
    required this.rating, required this.comment});

  toJson() => {
    "id_usuario_cliente": customerID,
    "id_pedido": orderID,
    "avaliacao_app": rating,
    "comentario_app": comment
  };
}