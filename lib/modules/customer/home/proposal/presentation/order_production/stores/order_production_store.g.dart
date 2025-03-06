// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_production_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderProductionStore on OrderProductionStoreBase, Store {
  late final _$orderAtom =
      Atom(name: 'OrderProductionStoreBase.order', context: context);

  @override
  OrderEntity? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderEntity? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$proposalAtom =
      Atom(name: 'OrderProductionStoreBase.proposal', context: context);

  @override
  ProposalEntity? get proposal {
    _$proposalAtom.reportRead();
    return super.proposal;
  }

  @override
  set proposal(ProposalEntity? value) {
    _$proposalAtom.reportWrite(value, super.proposal, () {
      super.proposal = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'OrderProductionStoreBase.loading', context: context);

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
      AsyncAction('OrderProductionStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$OrderProductionStoreBaseActionController =
      ActionController(name: 'OrderProductionStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$OrderProductionStoreBaseActionController.startAction(
        name: 'OrderProductionStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$OrderProductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
order: ${order},
proposal: ${proposal},
loading: ${loading}
    ''';
  }
}
