// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_employee_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChoiceEmployeeDetailsStore on ChoiceEmployeeDetailsStoreBase, Store {
  late final _$pageAtom =
      Atom(name: 'ChoiceEmployeeDetailsStoreBase.page', context: context);

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
      Atom(name: 'ChoiceEmployeeDetailsStoreBase.limit', context: context);

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

  late final _$employeesAtom =
      Atom(name: 'ChoiceEmployeeDetailsStoreBase.employees', context: context);

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

  late final _$orderAtom =
      Atom(name: 'ChoiceEmployeeDetailsStoreBase.order', context: context);

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
      Atom(name: 'ChoiceEmployeeDetailsStoreBase.proposal', context: context);

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
      Atom(name: 'ChoiceEmployeeDetailsStoreBase.loading', context: context);

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
      AsyncAction('ChoiceEmployeeDetailsStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$loadingMoreOrdersAsyncAction = AsyncAction(
      'ChoiceEmployeeDetailsStoreBase.loadingMoreOrders',
      context: context);

  @override
  Future loadingMoreOrders() {
    return _$loadingMoreOrdersAsyncAction.run(() => super.loadingMoreOrders());
  }

  late final _$ChoiceEmployeeDetailsStoreBaseActionController =
      ActionController(
          name: 'ChoiceEmployeeDetailsStoreBase', context: context);

  @override
  dynamic addPagination() {
    final _$actionInfo = _$ChoiceEmployeeDetailsStoreBaseActionController
        .startAction(name: 'ChoiceEmployeeDetailsStoreBase.addPagination');
    try {
      return super.addPagination();
    } finally {
      _$ChoiceEmployeeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ChoiceEmployeeDetailsStoreBaseActionController
        .startAction(name: 'ChoiceEmployeeDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ChoiceEmployeeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
limit: ${limit},
employees: ${employees},
order: ${order},
proposal: ${proposal},
loading: ${loading}
    ''';
  }
}
