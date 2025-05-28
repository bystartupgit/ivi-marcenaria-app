import 'package:marcenaria/modules/customer/home/orders/external/payment_datasource.dart';

class ConfirmPaymentUsecase {
  final PaymentDataSource datasource;

  ConfirmPaymentUsecase({required this.datasource});

  Future<bool> call({required int proposalID}) async =>
      datasource.confirmPayment(proposalID: proposalID);
}
