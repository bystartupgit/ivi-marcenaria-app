// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FinishStore on FinishStoreBase, Store {
  late final _$pageAtom = Atom(name: 'FinishStoreBase.page', context: context);

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
      Atom(name: 'FinishStoreBase.limit', context: context);

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

  late final _$loadingAtom =
      Atom(name: 'FinishStoreBase.loading', context: context);

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
      Atom(name: 'FinishStoreBase.orders', context: context);

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

  late final _$paginationLoadingAtom =
      Atom(name: 'FinishStoreBase.paginationLoading', context: context);

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
      AsyncAction('FinishStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$loadingMoreOrdersAsyncAction =
      AsyncAction('FinishStoreBase.loadingMoreOrders', context: context);

  @override
  Future loadingMoreOrders() {
    return _$loadingMoreOrdersAsyncAction.run(() => super.loadingMoreOrders());
  }

  late final _$FinishStoreBaseActionController =
      ActionController(name: 'FinishStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$FinishStoreBaseActionController.startAction(
        name: 'FinishStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$FinishStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPagination() {
    final _$actionInfo = _$FinishStoreBaseActionController.startAction(
        name: 'FinishStoreBase.addPagination');
    try {
      return super.addPagination();
    } finally {
      _$FinishStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPaginationLoading(bool value) {
    final _$actionInfo = _$FinishStoreBaseActionController.startAction(
        name: 'FinishStoreBase.setPaginationLoading');
    try {
      return super.setPaginationLoading(value);
    } finally {
      _$FinishStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
limit: ${limit},
loading: ${loading},
orders: ${orders},
paginationLoading: ${paginationLoading}
    ''';
  }
}
