


import 'package:marcenaria/modules/customer/home/external/user_datasource.dart';

import '../../../../login/domain/enums/user_type_enum.dart';

class GetUserUseCase {

  final UserDataSource datasource;

  GetUserUseCase({required this.datasource});

  Future<void> call ({required int id, required UserType type}) async =>
      datasource.getUserDetails(id: id, type: type);

}