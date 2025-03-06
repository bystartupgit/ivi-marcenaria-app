// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waiting_employee_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WaitingEmployeeDetailsStore on WaitingEmployeeDetailsStoreBase, Store {
  late final _$pageAtom =
      Atom(name: 'WaitingEmployeeDetailsStoreBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$limitAtom =
      Atom(name: 'WaitingEmployeeDetailsStoreBase.limit', context: context);

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$orderAtom =
      Atom(name: 'WaitingEmployeeDetailsStoreBase.order', context: context);

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
      Atom(name: 'WaitingEmployeeDetailsStoreBase.proposal', context: context);

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
      Atom(name: 'WaitingEmployeeDetailsStoreBase.employees', context: context);

  @override
  ObservableList<EmployeeUserEntity> get employees {
    _$employeesAtom.reportRead();
    return super.employees;
  }

  @override
  set employees(ObservableList<EmployeeUserEntity> value) {
    _$employeesAtom.reportWrite(value, super.employees, () {
      super.employees = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'WaitingEmployeeDetailsStoreBase.loading', context: context);

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
      AsyncAction('WaitingEmployeeDetailsStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$loadingMoreOrdersAsyncAction = AsyncAction(
      'WaitingEmployeeDetailsStoreBase.loadingMoreOrders',
      context: context);

  @override
  Future loadingMoreOrders() {
    return _$loadingMoreOrdersAsyncAction.run(() => super.loadingMoreOrders());
  }

  late final _$WaitingEmployeeDetailsStoreBaseActionController =
      ActionController(
          name: 'WaitingEmployeeDetailsStoreBase', context: context);

  @override
  dynamic addPagination() {
    final _$actionInfo = _$WaitingEmployeeDetailsStoreBaseActionController
        .startAction(name: 'WaitingEmployeeDetailsStoreBase.addPagination');
    try {
      return super.addPagination();
    } finally {
      _$WaitingEmployeeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$WaitingEmployeeDetailsStoreBaseActionController
        .startAction(name: 'WaitingEmployeeDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$WaitingEmployeeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
limit: ${limit},
order: ${order},
proposal: ${proposal},
employees: ${employees},
loading: ${loading}
    ''';
  }
}
