// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_code_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResetCodeStore on ResetCodeStoreBase, Store {
  Computed<bool>? _$codeCompleteComputed;

  @override
  bool get codeComplete =>
      (_$codeCompleteComputed ??= Computed<bool>(() => super.codeComplete,
              name: 'ResetCodeStoreBase.codeComplete'))
          .value;

  late final _$codeAtom =
      Atom(name: 'ResetCodeStoreBase.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ResetCodeStoreBase.loading', context: context);

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

  late final _$sendEmailResetAsyncAction =
      AsyncAction('ResetCodeStoreBase.sendEmailReset', context: context);

  @override
  Future sendEmailReset({required dynamic context}) {
    return _$sendEmailResetAsyncAction
        .run(() => super.sendEmailReset(context: context));
  }

  late final _$ResetCodeStoreBaseActionController =
      ActionController(name: 'ResetCodeStoreBase', context: context);

  @override
  dynamic setCode(String value) {
    final _$actionInfo = _$ResetCodeStoreBaseActionController.startAction(
        name: 'ResetCodeStoreBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ResetCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ResetCodeStoreBaseActionController.startAction(
        name: 'ResetCodeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ResetCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
loading: ${loading},
codeComplete: ${codeComplete}
    ''';
  }
}
