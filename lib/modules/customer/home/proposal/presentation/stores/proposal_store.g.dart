// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProposalStore on ProposalStoreBase, Store {
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??=
          Computed<String>(() => super.name, name: 'ProposalStoreBase.name'))
      .value;
  Computed<List<OrderEntity>>? _$productionOrdersFilteredComputed;

  @override
  List<OrderEntity> get productionOrdersFiltered =>
      (_$productionOrdersFilteredComputed ??= Computed<List<OrderEntity>>(
              () => super.productionOrdersFiltered,
              name: 'ProposalStoreBase.productionOrdersFiltered'))
          .value;
  Computed<List<OrderEntity>>? _$finishedOrdersFilteredComputed;

  @override
  List<OrderEntity> get finishedOrdersFiltered =>
      (_$finishedOrdersFilteredComputed ??= Computed<List<OrderEntity>>(
              () => super.finishedOrdersFiltered,
              name: 'ProposalStoreBase.finishedOrdersFiltered'))
          .value;

  late final _$indexAtom =
      Atom(name: 'ProposalStoreBase.index', context: context);

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
      Atom(name: 'ProposalStoreBase.pageWaiting', context: context);

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

  late final _$limitAtom =
      Atom(name: 'ProposalStoreBase.limit', context: context);

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
      Atom(name: 'ProposalStoreBase.filter', context: context);

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
      Atom(name: 'ProposalStoreBase.loading', context: context);

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

  late final _$productionOrdersAtom =
      Atom(name: 'ProposalStoreBase.productionOrders', context: context);

  @override
  ObservableList<OrderEntity> get productionOrders {
    _$productionOrdersAtom.reportRead();
    return super.productionOrders;
  }

  @override
  set productionOrders(ObservableList<OrderEntity> value) {
    _$productionOrdersAtom.reportWrite(value, super.productionOrders, () {
      super.productionOrders = value;
    });
  }

  late final _$finishedOrdersAtom =
      Atom(name: 'ProposalStoreBase.finishedOrders', context: context);

  @override
  ObservableList<OrderEntity> get finishedOrders {
    _$finishedOrdersAtom.reportRead();
    return super.finishedOrders;
  }

  @override
  set finishedOrders(ObservableList<OrderEntity> value) {
    _$finishedOrdersAtom.reportWrite(value, super.finishedOrders, () {
      super.finishedOrders = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('ProposalStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$ProposalStoreBaseActionController =
      ActionController(name: 'ProposalStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ProposalStoreBaseActionController.startAction(
        name: 'ProposalStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ProposalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$ProposalStoreBaseActionController.startAction(
        name: 'ProposalStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$ProposalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int value) {
    final _$actionInfo = _$ProposalStoreBaseActionController.startAction(
        name: 'ProposalStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$ProposalStoreBaseActionController.endAction(_$actionInfo);
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
productionOrders: ${productionOrders},
finishedOrders: ${finishedOrders},
name: ${name},
productionOrdersFiltered: ${productionOrdersFiltered},
finishedOrdersFiltered: ${finishedOrdersFiltered}
    ''';
  }
}
