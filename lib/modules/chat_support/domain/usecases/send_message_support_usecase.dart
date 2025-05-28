import 'package:marcenaria/modules/chat_support/domain/dto/message_support_dto.dart';

import '../../external/chat_datasource.dart';

class SendMessagesSupportUseCase {
  final ChatDataSource datasource;

  SendMessagesSupportUseCase({required this.datasource});

  Future<void> call({required MessageSupportDTO dto}) async =>
      datasource.sendMessageSupport(dto: dto);
}
