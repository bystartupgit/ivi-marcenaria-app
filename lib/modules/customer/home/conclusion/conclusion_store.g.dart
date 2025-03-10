// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conclusion_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConclusionStore on ConclusionStoreBase, Store {
  late final _$orderAtom =
      Atom(name: 'ConclusionStoreBase.order', context: context);

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
      Atom(name: 'ConclusionStoreBase.proposal', context: context);

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

  late final _$employeesAtom =
      Atom(name: 'ConclusionStoreBase.employees', context: context);

  @override
  List<EmployeeUserEntity> get employees {
    _$employeesAtom.reportRead();
    return super.employees;
  }

  @override
  set employees(List<EmployeeUserEntity> value) {
    _$employeesAtom.reportWrite(value, super.employees, () {
      super.employees = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ConclusionStoreBase.loading', context: context);

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

  late final _$ratingEmployeeAtom =
      Atom(name: 'ConclusionStoreBase.ratingEmployee', context: context);

  @override
  double get ratingEmployee {
    _$ratingEmployeeAtom.reportRead();
    return super.ratingEmployee;
  }

  @override
  set ratingEmployee(double value) {
    _$ratingEmployeeAtom.reportWrite(value, super.ratingEmployee, () {
      super.ratingEmployee = value;
    });
  }

  late final _$employeeCommentAtom =
      Atom(name: 'ConclusionStoreBase.employeeComment', context: context);

  @override
  String get employeeComment {
    _$employeeCommentAtom.reportRead();
    return super.employeeComment;
  }

  @override
  set employeeComment(String value) {
    _$employeeCommentAtom.reportWrite(value, super.employeeComment, () {
      super.employeeComment = value;
    });
  }

  late final _$ratingAppAtom =
      Atom(name: 'ConclusionStoreBase.ratingApp', context: context);

  @override
  double get ratingApp {
    _$ratingAppAtom.reportRead();
    return super.ratingApp;
  }

  @override
  set ratingApp(double value) {
    _$ratingAppAtom.reportWrite(value, super.ratingApp, () {
      super.ratingApp = value;
    });
  }

  late final _$appCommentAtom =
      Atom(name: 'ConclusionStoreBase.appComment', context: context);

  @override
  String get appComment {
    _$appCommentAtom.reportRead();
    return super.appComment;
  }

  @override
  set appComment(String value) {
    _$appCommentAtom.reportWrite(value, super.appComment, () {
      super.appComment = value;
    });
  }

  late final _$ratingAsyncAction =
      AsyncAction('ConclusionStoreBase.rating', context: context);

  @override
  Future rating({required dynamic context}) {
    return _$ratingAsyncAction.run(() => super.rating(context: context));
  }

  late final _$initAsyncAction =
      AsyncAction('ConclusionStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$ConclusionStoreBaseActionController =
      ActionController(name: 'ConclusionStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ConclusionStoreBaseActionController.startAction(
        name: 'ConclusionStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ConclusionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRatingEmployee(double value) {
    final _$actionInfo = _$ConclusionStoreBaseActionController.startAction(
        name: 'ConclusionStoreBase.setRatingEmployee');
    try {
      return super.setRatingEmployee(value);
    } finally {
      _$ConclusionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setemployeeComment(String value) {
    final _$actionInfo = _$ConclusionStoreBaseActionController.startAction(
        name: 'ConclusionStoreBase.setemployeeComment');
    try {
      return super.setemployeeComment(value);
    } finally {
      _$ConclusionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRatingApp(double value) {
    final _$actionInfo = _$ConclusionStoreBaseActionController.startAction(
        name: 'ConclusionStoreBase.setRatingApp');
    try {
      return super.setRatingApp(value);
    } finally {
      _$ConclusionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setappComment(String value) {
    final _$actionInfo = _$ConclusionStoreBaseActionController.startAction(
        name: 'ConclusionStoreBase.setappComment');
    try {
      return super.setappComment(value);
    } finally {
      _$ConclusionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
order: ${order},
proposal: ${proposal},
employees: ${employees},
loading: ${loading},
ratingEmployee: ${ratingEmployee},
employeeComment: ${employeeComment},
ratingApp: ${ratingApp},
appComment: ${appComment}
    ''';
  }
}
