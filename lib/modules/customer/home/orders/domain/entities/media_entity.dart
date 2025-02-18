



import 'package:marcenaria/modules/customer/home/orders/domain/mappers/media_mapper.dart';

class MediaEntity {

  final int id;
  final String name;
  final String type;
  final String path;
  final String description;

  MediaEntity({required this.id, required this.name, required this.type,
    required this.path, required this.description});

  factory MediaEntity.fromMap(Map<String, dynamic> map) =>
      MediaEntity(id: map[MediaMapper.id],
          name: map[MediaMapper.name],
          type: map[MediaMapper.type],
          path: map[MediaMapper.path],
          description: map[MediaMapper.description]
      );
}