import '../mappers/message_dto_mapper.dart';

class MessageDTO {
  final int userID;
  final int orderID;
  final String message;

  MessageDTO(
      {required this.userID, required this.orderID, required this.message});

  toMap() => {
        MessageDTOMapper.userID: userID,
        MessageDTOMapper.orderID: orderID,
        MessageDTOMapper.message: message,
      };
}
