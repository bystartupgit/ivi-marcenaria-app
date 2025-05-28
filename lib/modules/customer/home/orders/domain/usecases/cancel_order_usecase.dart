import '../../external/order_datasource.dart';

class CancelOrderUsecase {
  final OrderDataSource datasource;

  CancelOrderUsecase({required this.datasource});

  Future<bool> call({required int orderID}) async =>
      datasource.cancelOrder(orderID: orderID);
}
