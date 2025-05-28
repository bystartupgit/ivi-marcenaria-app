import '../../external/rating_datasource.dart';
import '../entities/rating_app_entity.dart';
import '../entities/rating_employee_entity.dart';

class RatingOrderUsecase {
  final RatingDatasource datasource;

  RatingOrderUsecase({required this.datasource});

  Future<(String, bool)> call(
          {required RatingAPPEntity app,
          required RatingEmployeeEntity employee}) async =>
      datasource.registerRating(app: app, employee: employee);
}
