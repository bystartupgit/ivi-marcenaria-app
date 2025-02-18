

import '../mappers/message_dto_mapper.dart';

class MessageSupportDTO {

  final int userID;
  final int suportID;
  final String message;

  MessageSupportDTO({required this.userID, required this.suportID, required this.message});

  toMap() => {
    MessageDTOMapper.userID: userID,
    MessageDTOMapper.suportID: suportID,
    MessageDTOMapper.message: message,
  };
}