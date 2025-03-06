// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'potential_employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PotentialEmployeeStore on PotentialEmployeeStoreBase, Store {
  Computed<bool>? _$hasEmployeeSelectedComputed;

  @override
  bool get hasEmployeeSelected => (_$hasEmployeeSelectedComputed ??=
          Computed<bool>(() => super.hasEmployeeSelected,
              name: 'PotentialEmployeeStoreBase.hasEmployeeSelected'))
      .value;

  late final _$debounceAtom =
      Atom(name: 'PotentialEmployeeStoreBase.debounce', context: context);

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

  late final _$pageAtom =
      Atom(name: 'PotentialEmployeeStoreBase.page', context: context);

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

  late final _$employeesAtom =
      Atom(name: 'PotentialEmployeeStoreBase.employees', context: context);

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

  late final _$employeeSelectedAtom = Atom(
      name: 'PotentialEmployeeStoreBase.employeeSelected', context: context);

  @override
  ObservableList<EmployeeUserEntity> get employeeSelected {
    _$employeeSelectedAtom.reportRead();
    return super.employeeSelected;
  }

  @override
  set employeeSelected(ObservableList<EmployeeUserEntity> value) {
    _$employeeSelectedAtom.reportWrite(value, super.employeeSelected, () {
      super.employeeSelected = value;
    });
  }

  late final _$limitAtom =
      Atom(name: 'PotentialEmployeeStoreBase.limit', context: context);

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

  late final _$nameAtom =
      Atom(name: 'PotentialEmployeeStoreBase.name', context: context);

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

  late final _$loadingAtom =
      Atom(name: 'PotentialEmployeeStoreBase.loading', context: context);

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
      AsyncAction('PotentialEmployeeStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$loadingMoreOrdersAsyncAction = AsyncAction(
      'PotentialEmployeeStoreBase.loadingMoreOrders',
      context: context);

  @override
  Future loadingMoreOrders() {
    return _$loadingMoreOrdersAsyncAction.run(() => super.loadingMoreOrders());
  }

  late final _$saveAsyncAction =
      AsyncAction('PotentialEmployeeStoreBase.save', context: context);

  @override
  Future save({required dynamic context, required int proposalID}) {
    return _$saveAsyncAction
        .run(() => super.save(context: context, proposalID: proposalID));
  }

  late final _$PotentialEmployeeStoreBaseActionController =
      ActionController(name: 'PotentialEmployeeStoreBase', context: context);

  @override
  dynamic addSelection(EmployeeUserEntity value) {
    final _$actionInfo = _$PotentialEmployeeStoreBaseActionController
        .startAction(name: 'PotentialEmployeeStoreBase.addSelection');
    try {
      return super.addSelection(value);
    } finally {
      _$PotentialEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeSelection(EmployeeUserEntity value) {
    final _$actionInfo = _$PotentialEmployeeStoreBaseActionController
        .startAction(name: 'PotentialEmployeeStoreBase.removeSelection');
    try {
      return super.removeSelection(value);
    } finally {
      _$PotentialEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$PotentialEmployeeStoreBaseActionController
        .startAction(name: 'PotentialEmployeeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$PotentialEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPagination() {
    final _$actionInfo = _$PotentialEmployeeStoreBaseActionController
        .startAction(name: 'PotentialEmployeeStoreBase.addPagination');
    try {
      return super.addPagination();
    } finally {
      _$PotentialEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value, dynamic context) {
    final _$actionInfo = _$PotentialEmployeeStoreBaseActionController
        .startAction(name: 'PotentialEmployeeStoreBase.setFilter');
    try {
      return super.setFilter(value, context);
    } finally {
      _$PotentialEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
debounce: ${debounce},
page: ${page},
employees: ${employees},
employeeSelected: ${employeeSelected},
limit: ${limit},
name: ${name},
loading: ${loading},
hasEmployeeSelected: ${hasEmployeeSelected}
    ''';
  }
}
