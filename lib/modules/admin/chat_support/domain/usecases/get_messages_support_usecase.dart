import '../../external/chat_datasource.dart';
import '../entities/message_entity.dart';

class GetMessagesSupportUseCase {
  final ChatDataSource datasource;

  GetMessagesSupportUseCase({required this.datasource});

  Future<List<MessageEntity>> call(
          {required supportID, required int page, required int limit}) async =>
      datasource.getMessagesSupport(
          supportID: supportID, page: page, limit: limit);
}
