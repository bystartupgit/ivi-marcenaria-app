class RatingEmployeeEntity {
  final int customerID;
  final int orderID;
  final int employeeID;
  final int rating;
  final String comment;

  RatingEmployeeEntity(
      {required this.customerID,
      required this.orderID,
      required this.employeeID,
      required this.rating,
      required this.comment});

  toJson() => {
        "id_usuario_cliente": customerID,
        "id_pedido": orderID,
        "id_usuario_prestador": employeeID,
        "avaliacao_prestador": rating,
        "comentario_prestador": comment
      };
}
