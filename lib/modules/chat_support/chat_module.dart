import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/chat_support/domain/usecases/get_messages_support_usecase.dart';
import 'package:marcenaria/modules/chat_support/domain/usecases/get_messages_usecase.dart';
import 'package:marcenaria/modules/chat_support/domain/usecases/send_message_support_usecase.dart';
import 'package:marcenaria/modules/chat_support/domain/usecases/send_message_usecase.dart';
import 'package:marcenaria/modules/chat_support/external/chat_datasource.dart';
import 'package:marcenaria/modules/chat_support/presentation/chat_page.dart';
import 'package:marcenaria/modules/chat_support/presentation/stores/chat_store.dart';

class ChatSuportModule extends Module {
  @override
  void binds(i) {
    i.add(() => ChatStore());
    i.add(() => ChatDataSource());

    i.add(() => GetMessagesUseCase(datasource: i.get<ChatDataSource>()));
    i.add(() => GetMessagesSupportUseCase(datasource: i.get<ChatDataSource>()));
    i.add(
        () => SendMessagesSupportUseCase(datasource: i.get<ChatDataSource>()));
    i.add(() => SendMessagesUseCase(datasource: i.get<ChatDataSource>()));
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => ChatPage(order: r.args.data));
  }
}
