class CreateOrderDTO {
  final int customerID;
  final String title;
  final String description;
  final String environments;
  final bool whatsapp;

  CreateOrderDTO({
    required this.customerID,
    required this.title,
    required this.description,
    required this.environments,
    this.whatsapp = false,
  });

  Map<String, dynamic> toMap() => {
        "id_cliente": customerID,
        "titulo": title,
        "descricao": description,
        "ambientes": environments,
        "contato": whatsapp,
      };
}

