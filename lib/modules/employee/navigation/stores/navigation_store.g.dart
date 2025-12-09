// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on NavigationStoreBase, Store {
  late final _$indexAtom =
      Atom(name: 'NavigationStoreBase.index', context: context);

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

  late final _$loadingAtom =
      Atom(name: 'NavigationStoreBase.loading', context: context);

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
      AsyncAction('NavigationStoreBase.init', context: context);

  @override
  Future init(dynamic context) {
    return _$initAsyncAction.run(() => super.init(context));
  }

  late final _$NavigationStoreBaseActionController =
      ActionController(name: 'NavigationStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$NavigationStoreBaseActionController.startAction(
        name: 'NavigationStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$NavigationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int value) {
    final _$actionInfo = _$NavigationStoreBaseActionController.startAction(
        name: 'NavigationStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$NavigationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic logout() {
    final _$actionInfo = _$NavigationStoreBaseActionController.startAction(
        name: 'NavigationStoreBase.logout');
    try {
      return super.logout();
    } finally {
      _$NavigationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
loading: ${loading}
    ''';
  }
}
