



import '../../external/chat_datasource.dart';
import '../entities/message_entity.dart';

class GetMessagesUseCase {

  final ChatDataSource datasource;

  GetMessagesUseCase({required this.datasource});

  Future<List<MessageEntity>> call({required orderID, required int page, required int limit}) async =>
      datasource.getMessages(orderID: orderID, page: page, limit: limit);


}