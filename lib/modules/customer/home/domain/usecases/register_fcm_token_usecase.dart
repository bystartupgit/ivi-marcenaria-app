import 'package:marcenaria/modules/customer/home/external/user_datasource.dart';

class RegisterFcmTokenUsecase {

  final UserDataSource datasource;

  RegisterFcmTokenUsecase({required this.datasource});

  Future<bool> call ({required int userID, required String fcmToken}) async =>
      datasource.registerFirebaseToken(fcmToken: fcmToken, userID: userID);

}