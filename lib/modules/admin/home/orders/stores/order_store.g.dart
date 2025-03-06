// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStore on OrderStoreBase, Store {
  late final _$pageWaitingEmployeesAtom =
      Atom(name: 'OrderStoreBase.pageWaitingEmployees', context: context);

  @override
  int get pageWaitingEmployees {
    _$pageWaitingEmployeesAtom.reportRead();
    return super.pageWaitingEmployees;
  }

  @override
  set pageWaitingEmployees(int value) {
    _$pageWaitingEmployeesAtom.reportWrite(value, super.pageWaitingEmployees,
        () {
      super.pageWaitingEmployees = value;
    });
  }

  late final _$pageDeclinedEmployeesAtom =
      Atom(name: 'OrderStoreBase.pageDeclinedEmployees', context: context);

  @override
  int get pageDeclinedEmployees {
    _$pageDeclinedEmployeesAtom.reportRead();
    return super.pageDeclinedEmployees;
  }

  @override
  set pageDeclinedEmployees(int value) {
    _$pageDeclinedEmployeesAtom.reportWrite(value, super.pageDeclinedEmployees,
        () {
      super.pageDeclinedEmployees = value;
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

  late final _$OrderStoreBaseActionController =
      ActionController(name: 'OrderStoreBase', context: context);

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
  String toString() {
    return '''
pageWaitingEmployees: ${pageWaitingEmployees},
pageDeclinedEmployees: ${pageDeclinedEmployees},
limit: ${limit},
index: ${index}
    ''';
  }
}
