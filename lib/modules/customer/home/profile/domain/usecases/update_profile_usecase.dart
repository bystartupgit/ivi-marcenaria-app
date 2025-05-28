import 'package:marcenaria/modules/customer/home/profile/external/profile_datasource.dart';

import '../dtos/profile_dto.dart';

class UpdateProfileUsecase {
  final ProfileDatasource datasource;

  UpdateProfileUsecase({required this.datasource});

  Future<bool> call({required userID, required ProfileDTO dto}) async =>
      await datasource.updateProfile(userID: userID, dto: dto);
}
