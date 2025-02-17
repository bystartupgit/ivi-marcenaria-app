// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStore on OrderStoreBase, Store {
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??=
          Computed<String>(() => super.name, name: 'OrderStoreBase.name'))
      .value;
  Computed<List<OrderEntity>>? _$waitingOrdersFilteredComputed;

  @override
  List<OrderEntity> get waitingOrdersFiltered =>
      (_$waitingOrdersFilteredComputed ??= Computed<List<OrderEntity>>(
              () => super.waitingOrdersFiltered,
              name: 'OrderStoreBase.waitingOrdersFiltered'))
          .value;
  Computed<List<OrderEntity>>? _$waitingApprovalOrdersFilteredComputed;

  @override
  List<OrderEntity> get waitingApprovalOrdersFiltered =>
      (_$waitingApprovalOrdersFilteredComputed ??= Computed<List<OrderEntity>>(
              () => super.waitingApprovalOrdersFiltered,
              name: 'OrderStoreBase.waitingApprovalOrdersFiltered'))
          .value;

  late final _$indexAtom = Atom(name: 'OrderStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$pageWaitingAtom =
      Atom(name: 'OrderStoreBase.pageWaiting', context: context);

  @override
  int get pageWaiting {
    _$pageWaitingAtom.reportRead();
    return super.pageWaiting;
  }

  @override
  set pageWaiting(int value) {
    _$pageWaitingAtom.reportWrite(value, super.pageWaiting, () {
      super.pageWaiting = value;
    });
  }

  late final _$limitAtom = Atom(name: 'OrderStoreBase.limit', context: context);

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

  late final _$filterAtom =
      Atom(name: 'OrderStoreBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'OrderStoreBase.loading', context: context);

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

  late final _$ordersAtom =
      Atom(name: 'OrderStoreBase.orders', context: context);

  @override
  ObservableList<OrderEntity> get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(ObservableList<OrderEntity> value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  late final _$waitingOrdersAtom =
      Atom(name: 'OrderStoreBase.waitingOrders', context: context);

  @override
  ObservableList<OrderEntity> get waitingOrders {
    _$waitingOrdersAtom.reportRead();
    return super.waitingOrders;
  }

  @override
  set waitingOrders(ObservableList<OrderEntity> value) {
    _$waitingOrdersAtom.reportWrite(value, super.waitingOrders, () {
      super.waitingOrders = value;
    });
  }

  late final _$waitingApprovalOrdersAtom =
      Atom(name: 'OrderStoreBase.waitingApprovalOrders', context: context);

  @override
  ObservableList<OrderEntity> get waitingApprovalOrders {
    _$waitingApprovalOrdersAtom.reportRead();
    return super.waitingApprovalOrders;
  }

  @override
  set waitingApprovalOrders(ObservableList<OrderEntity> value) {
    _$waitingApprovalOrdersAtom.reportWrite(value, super.waitingApprovalOrders,
        () {
      super.waitingApprovalOrders = value;
    });
  }

  late final _$loadingNewOrdersAsyncAction =
      AsyncAction('OrderStoreBase.loadingNewOrders', context: context);

  @override
  Future loadingNewOrders() {
    return _$loadingNewOrdersAsyncAction.run(() => super.loadingNewOrders());
  }

  late final _$initAsyncAction =
      AsyncAction('OrderStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$OrderStoreBaseActionController =
      ActionController(name: 'OrderStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$OrderStoreBaseActionController.startAction(
        name: 'OrderStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$OrderStoreBaseActionController.startAction(
        name: 'OrderStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int value) {
    final _$actionInfo = _$OrderStoreBaseActionController.startAction(
        name: 'OrderStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeWaitingOrders(OrderEntity order) {
    final _$actionInfo = _$OrderStoreBaseActionController.startAction(
        name: 'OrderStoreBase.removeWaitingOrders');
    try {
      return super.removeWaitingOrders(order);
    } finally {
      _$OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addWaigintOrders(OrderEntity order) {
    final _$actionInfo = _$OrderStoreBaseActionController.startAction(
        name: 'OrderStoreBase.addWaigintOrders');
    try {
      return super.addWaigintOrders(order);
    } finally {
      _$OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
pageWaiting: ${pageWaiting},
limit: ${limit},
filter: ${filter},
loading: ${loading},
orders: ${orders},
waitingOrders: ${waitingOrders},
waitingApprovalOrders: ${waitingApprovalOrders},
name: ${name},
waitingOrdersFiltered: ${waitingOrdersFiltered},
waitingApprovalOrdersFiltered: ${waitingApprovalOrdersFiltered}
    ''';
  }
}
