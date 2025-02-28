
enum NotificationType { startJob, conclusionJob, newMessage,
  newProposal, newInteresting, selectEmployee, newOrder, interesting,
  approvalProposal, disapprovalProposal  }

extension NotificationStatus on NotificationType {

  static NotificationType fromString(String value) => switch(value) {
    "inicio_execucao" => NotificationType.startJob,
    "conclusao_execucao" => NotificationType.conclusionJob,
    "nova_mensagem" => NotificationType.newMessage,
    "nova_proposta" => NotificationType.newProposal,
    "interesse_prestador" => NotificationType.newInteresting,
    "selecao_prestadores" => NotificationType.selectEmployee,
    "novo_pedido" => NotificationType.newOrder,
    "interesse" => NotificationType.interesting,
    "aprovacao_proposta" => NotificationType.approvalProposal,
    "reprovacao_proposta" => NotificationType.disapprovalProposal,
    _ => NotificationType.newMessage
  };

  static String fromTitle(NotificationType value) => switch(value) {
    NotificationType.startJob => "Serviço iniciado",
    NotificationType.conclusionJob => "Serviço concluído",
    NotificationType.newMessage => "Você recebeu uma nova mensagem",
    NotificationType.newProposal => "Você recebeu uma nova proposta",
    NotificationType.newInteresting => "Um prestador demonstrou interesse na sua proposta",
    NotificationType.selectEmployee => "Novos prestadores disponíveis",
    NotificationType.newOrder => "Novo pedido",
    NotificationType.interesting => "Interesse",
    NotificationType.approvalProposal => "A proposta foi aprovada!",
    NotificationType.disapprovalProposal => "A proposta foi desaprovada!",
  };


}