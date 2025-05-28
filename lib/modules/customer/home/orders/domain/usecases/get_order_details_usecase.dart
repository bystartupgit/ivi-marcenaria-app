import 'package:marcenaria/modules/customer/home/orders/domain/entities/media_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/external/order_datasource.dart';

class GetOrderDetailsUsecase {
  final OrderDataSource datasource;

  GetOrderDetailsUsecase({required this.datasource});

  Future<MediaEntity?> call({required int orderID}) async =>
      datasource.getMedias(orderID: orderID);
}
