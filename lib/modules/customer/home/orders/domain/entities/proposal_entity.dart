import 'package:marcenaria/modules/customer/home/orders/domain/enum/order_status_enum.dart';

class ProposalEntity {
  int idProposta;
  int idPedido;
  int? idPrestador;
  String mensagem;
  String valorTotal;
  String valorPix;
  String valorDesconto;
  String entradaMinima;
  int parcelas;
  bool escassezTemporal;
  String? dePor;
  String? urlArquivoOrcamento;
  OrderStatus status;
  DateTime dataCriacao;
  DateTime dataAtualizacao;
  Pedido pedido;

  ProposalEntity({
    required this.idProposta,
    required this.idPedido,
    required this.idPrestador,
    required this.mensagem,
    required this.valorTotal,
    required this.valorPix,
    required this.valorDesconto,
    required this.entradaMinima,
    required this.parcelas,
    required this.escassezTemporal,
    required this.dePor,
    required this.urlArquivoOrcamento,
    required this.status,
    required this.dataCriacao,
    required this.dataAtualizacao,
    required this.pedido,
  });

  factory ProposalEntity.fromJson(Map<String, dynamic> json) => ProposalEntity(
    idProposta: json["id_proposta"],
    idPedido: json["id_pedido"],
    idPrestador: json["id_prestador"],
    mensagem: json["mensagem"],
    valorTotal: json["valor_total"],
    valorPix: json["valor_pix"],
    valorDesconto: json["valor_desconto"],
    entradaMinima: json["entrada_minima"],
    parcelas: json["parcelas"],
    escassezTemporal: json["escassez_temporal"],
    dePor: json["de_por"],
    urlArquivoOrcamento: json["url_arquivo_orcamento"],
    status: StatusExtension.fromString(json["status"]),
    dataCriacao: DateTime.parse(json["data_criacao"]),
    dataAtualizacao: DateTime.parse(json["data_atualizacao"]),
    pedido: Pedido.fromJson(json["pedido"]),
  );

  Map<String, dynamic> toJson() => {
    "id_proposta": idProposta,
    "id_pedido": idPedido,
    "id_prestador": idPrestador,
    "mensagem": mensagem,
    "valor_total": valorTotal,
    "valor_pix": valorPix,
    "valor_desconto": valorDesconto,
    "entrada_minima": entradaMinima,
    "parcelas": parcelas,
    "escassez_temporal": escassezTemporal,
    "de_por": dePor,
    "url_arquivo_orcamento": urlArquivoOrcamento,
    "status": status,
    "data_criacao": dataCriacao.toIso8601String(),
    "data_atualizacao": dataAtualizacao.toIso8601String(),
    "pedido": pedido.toJson(),
  };
}

class Pedido {
  String titulo;
  bool contato;

  Pedido({
    required this.titulo,
    required this.contato,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
    titulo: json["titulo"],
    contato: json["contato"],
  );

  Map<String, dynamic> toJson() => {
    "titulo": titulo,
    "contato": contato,
  };
}