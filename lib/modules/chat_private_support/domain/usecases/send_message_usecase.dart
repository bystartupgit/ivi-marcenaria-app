

import '../../external/chat_datasource.dart';
import '../dto/message_dto.dart';

class SendMessagesUseCase {

  final ChatDataSource datasource;

  SendMessagesUseCase({required this.datasource});

  Future<void> call({required MessageDTO dto}) async =>
      datasource.sendMessage(dto: dto);


}