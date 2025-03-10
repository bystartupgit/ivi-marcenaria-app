


import '../../../login/domain/enums/user_type_enum.dart';

class SuportChatUtil {


  static String subtitleSuport({ required UserType user, required String senderName, required UserType sender}) {

    if(user == UserType.administrador) {
      return "$senderName e você";
    }

    else {
      return "Suporte e você";
    }
  }

}