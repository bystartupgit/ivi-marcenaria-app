

import '../../external/user_datasource.dart';
import '../dto/profile_dto.dart';

class UpdateProfileEmployeeUsecase {

  final UserDataSource datasource;

  UpdateProfileEmployeeUsecase({required this.datasource});

  Future<bool> call({required userID, required ProfileDTO dto}) async =>
      await datasource.updateProfile(userID: userID, dto: dto);

}