class ProposalEntity {
  int idProposta;
  int idPedido;
  int? idPrestador;
  String mensagem;
  String valorTotal;
  String valorPix;
  String valorDesconto;
  String? valorParc;
  String entradaMinima;
  int parcelas;
  bool escassezTemporal;
  String? dePor;
  String? urlArquivoOrcamento;
  DateTime dataCriacao;
  DateTime dataAtualizacao;

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
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.valorParc
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
    dataCriacao: DateTime.parse(json["data_criacao"]),
    dataAtualizacao: DateTime.parse(json["data_atualizacao"]),
    valorParc: json["valor_parc"]
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
    "data_criacao": dataCriacao.toIso8601String(),
    "data_atualizacao": dataAtualizacao.toIso8601String(),
  };
}