// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waiting_interesting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WaitingInterestiongStore on WaitingInterestiongStoreBase, Store {
  late final _$pageAtom =
      Atom(name: 'WaitingInterestiongStoreBase.page', context: context);

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
      Atom(name: 'WaitingInterestiongStoreBase.limit', context: context);

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
      Atom(name: 'WaitingInterestiongStoreBase.loading', context: context);

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
      Atom(name: 'WaitingInterestiongStoreBase.orders', context: context);

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

  late final _$initAsyncAction =
      AsyncAction('WaitingInterestiongStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$WaitingInterestiongStoreBaseActionController =
      ActionController(name: 'WaitingInterestiongStoreBase', context: context);

  @override
  dynamic removeOrderByID(int id) {
    final _$actionInfo = _$WaitingInterestiongStoreBaseActionController
        .startAction(name: 'WaitingInterestiongStoreBase.removeOrderByID');
    try {
      return super.removeOrderByID(id);
    } finally {
      _$WaitingInterestiongStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$WaitingInterestiongStoreBaseActionController
        .startAction(name: 'WaitingInterestiongStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$WaitingInterestiongStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPagination() {
    final _$actionInfo = _$WaitingInterestiongStoreBaseActionController
        .startAction(name: 'WaitingInterestiongStoreBase.setPagination');
    try {
      return super.setPagination();
    } finally {
      _$WaitingInterestiongStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
limit: ${limit},
loading: ${loading},
orders: ${orders}
    ''';
  }
}
