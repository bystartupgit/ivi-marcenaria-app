


import 'package:marcenaria/core/data/entities/profile_entity.dart';
import 'package:marcenaria/modules/admin/external/user_datasource.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';


class GetUserUseCase {

  final UserDataSource datasource;

  GetUserUseCase({required this.datasource});

  Future<ProfileEntity?> call ({required int id, required UserType type}) async =>
      datasource.getUserDetails(id: id, type: type);

}