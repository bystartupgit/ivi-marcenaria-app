// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileFormStore on ProfileFormStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: 'ProfileFormStoreBase.loading', context: context);

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
      AsyncAction('ProfileFormStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$updateAsyncAction =
      AsyncAction('ProfileFormStoreBase.update', context: context);

  @override
  Future update({required dynamic context}) {
    return _$updateAsyncAction.run(() => super.update(context: context));
  }

  late final _$ProfileFormStoreBaseActionController =
      ActionController(name: 'ProfileFormStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ProfileFormStoreBaseActionController.startAction(
        name: 'ProfileFormStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ProfileFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
