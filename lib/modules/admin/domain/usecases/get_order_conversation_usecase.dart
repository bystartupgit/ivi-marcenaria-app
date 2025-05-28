import '../../external/conversation_datasource.dart';
import '../entities/conversation_order_entity.dart';

class GetPrivateConversationUsecase {
  final ConversationDataSource datasource;

  GetPrivateConversationUsecase({required this.datasource});

  Future<List<ConversationOrderEntity>> call(
          {required int page, required int limit, String title = ""}) async =>
      datasource.getOrderConversations(limit: limit, page: page, title: title);
}
