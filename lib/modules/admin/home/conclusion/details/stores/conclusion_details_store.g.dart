// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conclusion_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConclusionDetailsStore on ConclusionDetailsStoreBase, Store {
  late final _$orderAtom =
      Atom(name: 'ConclusionDetailsStoreBase.order', context: context);

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
      Atom(name: 'ConclusionDetailsStoreBase.proposal', context: context);

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

  late final _$employeesAtom =
      Atom(name: 'ConclusionDetailsStoreBase.employees', context: context);

  @override
  List<EmployeeUserEntity> get employees {
    _$employeesAtom.reportRead();
    return super.employees;
  }

  @override
  set employees(List<EmployeeUserEntity> value) {
    _$employeesAtom.reportWrite(value, super.employees, () {
      super.employees = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ConclusionDetailsStoreBase.loading', context: context);

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
      AsyncAction('ConclusionDetailsStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$ConclusionDetailsStoreBaseActionController =
      ActionController(name: 'ConclusionDetailsStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ConclusionDetailsStoreBaseActionController
        .startAction(name: 'ConclusionDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ConclusionDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
order: ${order},
proposal: ${proposal},
employees: ${employees},
loading: ${loading}
    ''';
  }
}
