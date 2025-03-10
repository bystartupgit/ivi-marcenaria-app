// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductionStore on ProductionStoreBase, Store {
  late final _$pageAtom =
      Atom(name: 'ProductionStoreBase.page', context: context);

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
      Atom(name: 'ProductionStoreBase.limit', context: context);

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

  late final _$ordersAtom =
      Atom(name: 'ProductionStoreBase.orders', context: context);

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

  late final _$loadingAtom =
      Atom(name: 'ProductionStoreBase.loading', context: context);

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

  late final _$paginationLoadingAtom =
      Atom(name: 'ProductionStoreBase.paginationLoading', context: context);

  @override
  bool get paginationLoading {
    _$paginationLoadingAtom.reportRead();
    return super.paginationLoading;
  }

  @override
  set paginationLoading(bool value) {
    _$paginationLoadingAtom.reportWrite(value, super.paginationLoading, () {
      super.paginationLoading = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('ProductionStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$loadingNewOrdersAsyncAction =
      AsyncAction('ProductionStoreBase.loadingNewOrders', context: context);

  @override
  Future loadingNewOrders({required dynamic context}) {
    return _$loadingNewOrdersAsyncAction
        .run(() => super.loadingNewOrders(context: context));
  }

  late final _$loadingMoreOrdersAsyncAction =
      AsyncAction('ProductionStoreBase.loadingMoreOrders', context: context);

  @override
  Future loadingMoreOrders() {
    return _$loadingMoreOrdersAsyncAction.run(() => super.loadingMoreOrders());
  }

  late final _$ProductionStoreBaseActionController =
      ActionController(name: 'ProductionStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ProductionStoreBaseActionController.startAction(
        name: 'ProductionStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ProductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPaginationLoading(bool value) {
    final _$actionInfo = _$ProductionStoreBaseActionController.startAction(
        name: 'ProductionStoreBase.setPaginationLoading');
    try {
      return super.setPaginationLoading(value);
    } finally {
      _$ProductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPagination() {
    final _$actionInfo = _$ProductionStoreBaseActionController.startAction(
        name: 'ProductionStoreBase.addPagination');
    try {
      return super.addPagination();
    } finally {
      _$ProductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeOrderByID(int id) {
    final _$actionInfo = _$ProductionStoreBaseActionController.startAction(
        name: 'ProductionStoreBase.removeOrderByID');
    try {
      return super.removeOrderByID(id);
    } finally {
      _$ProductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
limit: ${limit},
orders: ${orders},
loading: ${loading},
paginationLoading: ${paginationLoading}
    ''';
  }
}
