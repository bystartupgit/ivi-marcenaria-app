


import 'package:marcenaria/core/utils/date_utils.dart';

import '../mappers/message_mapper.dart';

class MessageEntity {

  final int id;
  final int senderID;
  final String message;
  final DateTime date;

  MessageEntity({
    required this.id,
    required this.senderID,
    required this.message, required this.date});

  factory MessageEntity.fromMap(Map<String,dynamic> map) =>
      MessageEntity(
          id: map[MessageMapper.id],
          senderID: map[MessageMapper.senderID],
          message: map[MessageMapper.message],
          date: DateUtil.convertStringToDatatime(map[MessageMapper.date]));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is MessageEntity) { return id == other.id; }
    return false;
  }

  @override
  int get hashCode => id.hashCode;



}