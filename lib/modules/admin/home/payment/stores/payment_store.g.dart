// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentStore on PaymentStoreBase, Store {
  late final _$orderAtom =
      Atom(name: 'PaymentStoreBase.order', context: context);

  @override
  OrderWithoutProposalEntity? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderWithoutProposalEntity? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$moreDetailsAtom =
      Atom(name: 'PaymentStoreBase.moreDetails', context: context);

  @override
  bool get moreDetails {
    _$moreDetailsAtom.reportRead();
    return super.moreDetails;
  }

  @override
  set moreDetails(bool value) {
    _$moreDetailsAtom.reportWrite(value, super.moreDetails, () {
      super.moreDetails = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'PaymentStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('PaymentStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$PaymentStoreBaseActionController =
      ActionController(name: 'PaymentStoreBase', context: context);

  @override
  dynamic changeMoreDetails() {
    final _$actionInfo = _$PaymentStoreBaseActionController.startAction(
        name: 'PaymentStoreBase.changeMoreDetails');
    try {
      return super.changeMoreDetails();
    } finally {
      _$PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$PaymentStoreBaseActionController.startAction(
        name: 'PaymentStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
order: ${order},
moreDetails: ${moreDetails},
loading: ${loading}
    ''';
  }
}
