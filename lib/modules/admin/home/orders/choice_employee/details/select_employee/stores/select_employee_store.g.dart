// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectEmployeeStore on SelectEmployeeStoreBase, Store {
  Computed<bool>? _$hasSelectedComputed;

  @override
  bool get hasSelected =>
      (_$hasSelectedComputed ??= Computed<bool>(() => super.hasSelected,
              name: 'SelectEmployeeStoreBase.hasSelected'))
          .value;

  late final _$debounceAtom =
      Atom(name: 'SelectEmployeeStoreBase.debounce', context: context);

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
      Atom(name: 'SelectEmployeeStoreBase.page', context: context);

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
      Atom(name: 'SelectEmployeeStoreBase.employees', context: context);

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

  late final _$employeedSelectedAtom =
      Atom(name: 'SelectEmployeeStoreBase.employeedSelected', context: context);

  @override
  EmployeeUserEntity? get employeedSelected {
    _$employeedSelectedAtom.reportRead();
    return super.employeedSelected;
  }

  @override
  set employeedSelected(EmployeeUserEntity? value) {
    _$employeedSelectedAtom.reportWrite(value, super.employeedSelected, () {
      super.employeedSelected = value;
    });
  }

  late final _$limitAtom =
      Atom(name: 'SelectEmployeeStoreBase.limit', context: context);

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
      Atom(name: 'SelectEmployeeStoreBase.name', context: context);

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
      Atom(name: 'SelectEmployeeStoreBase.loading', context: context);

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
      AsyncAction('SelectEmployeeStoreBase.init', context: context);

  @override
  Future init({required dynamic proposalID}) {
    return _$initAsyncAction.run(() => super.init(proposalID: proposalID));
  }

  late final _$loadingMoreOrdersAsyncAction = AsyncAction(
      'SelectEmployeeStoreBase.loadingMoreOrders',
      context: context);

  @override
  Future loadingMoreOrders() {
    return _$loadingMoreOrdersAsyncAction.run(() => super.loadingMoreOrders());
  }

  late final _$saveAsyncAction =
      AsyncAction('SelectEmployeeStoreBase.save', context: context);

  @override
  Future save({required dynamic context, required dynamic proposalID}) {
    return _$saveAsyncAction
        .run(() => super.save(context: context, proposalID: proposalID));
  }

  late final _$SelectEmployeeStoreBaseActionController =
      ActionController(name: 'SelectEmployeeStoreBase', context: context);

  @override
  dynamic setSelectEmployee(EmployeeUserEntity? value) {
    final _$actionInfo = _$SelectEmployeeStoreBaseActionController.startAction(
        name: 'SelectEmployeeStoreBase.setSelectEmployee');
    try {
      return super.setSelectEmployee(value);
    } finally {
      _$SelectEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$SelectEmployeeStoreBaseActionController.startAction(
        name: 'SelectEmployeeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$SelectEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPagination() {
    final _$actionInfo = _$SelectEmployeeStoreBaseActionController.startAction(
        name: 'SelectEmployeeStoreBase.addPagination');
    try {
      return super.addPagination();
    } finally {
      _$SelectEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value, dynamic context, int proposalID) {
    final _$actionInfo = _$SelectEmployeeStoreBaseActionController.startAction(
        name: 'SelectEmployeeStoreBase.setFilter');
    try {
      return super.setFilter(value, context, proposalID);
    } finally {
      _$SelectEmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
debounce: ${debounce},
page: ${page},
employees: ${employees},
employeedSelected: ${employeedSelected},
limit: ${limit},
name: ${name},
loading: ${loading},
hasSelected: ${hasSelected}
    ''';
  }
}
