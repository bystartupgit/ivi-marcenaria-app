// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerStore on CustomerStoreBase, Store {
  late final _$debounceAtom =
      Atom(name: 'CustomerStoreBase.debounce', context: context);

  @override
  Timer? get debounce {
    _$debounceAtom.reportRead();
    return super.debounce;
  }

  @override
  set debounce(Timer? value) {
    _$debounceAtom.reportWrite(value, super.debounce, () {
      super.debounce = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'CustomerStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$pageAtom =
      Atom(name: 'CustomerStoreBase.page', context: context);

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
      Atom(name: 'CustomerStoreBase.limit', context: context);

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

  late final _$customersAtom =
      Atom(name: 'CustomerStoreBase.customers', context: context);

  @override
  ObservableList<CustomerUserEntity> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(ObservableList<CustomerUserEntity> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'CustomerStoreBase.loading', context: context);

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

  late final _$loadingMoreCustomersAsyncAction =
      AsyncAction('CustomerStoreBase.loadingMoreCustomers', context: context);

  @override
  Future loadingMoreCustomers() {
    return _$loadingMoreCustomersAsyncAction
        .run(() => super.loadingMoreCustomers());
  }

  late final _$initAsyncAction =
      AsyncAction('CustomerStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$CustomerStoreBaseActionController =
      ActionController(name: 'CustomerStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$CustomerStoreBaseActionController.startAction(
        name: 'CustomerStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPagination() {
    final _$actionInfo = _$CustomerStoreBaseActionController.startAction(
        name: 'CustomerStoreBase.addPagination');
    try {
      return super.addPagination();
    } finally {
      _$CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value, dynamic context) {
    final _$actionInfo = _$CustomerStoreBaseActionController.startAction(
        name: 'CustomerStoreBase.setFilter');
    try {
      return super.setFilter(value, context);
    } finally {
      _$CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
debounce: ${debounce},
name: ${name},
page: ${page},
limit: ${limit},
customers: ${customers},
loading: ${loading}
    ''';
  }
}
