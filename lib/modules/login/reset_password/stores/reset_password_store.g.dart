// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResetPasswordStore on ResetPasswordStoreBase, Store {
  Computed<bool>? _$emailNotEmptyComputed;

  @override
  bool get emailNotEmpty =>
      (_$emailNotEmptyComputed ??= Computed<bool>(() => super.emailNotEmpty,
              name: 'ResetPasswordStoreBase.emailNotEmpty'))
          .value;

  late final _$emailAtom =
      Atom(name: 'ResetPasswordStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ResetPasswordStoreBase.loading', context: context);

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
      AsyncAction('ResetPasswordStoreBase.sendEmailReset', context: context);

  @override
  Future sendEmailReset({required dynamic context}) {
    return _$sendEmailResetAsyncAction
        .run(() => super.sendEmailReset(context: context));
  }

  late final _$ResetPasswordStoreBaseActionController =
      ActionController(name: 'ResetPasswordStoreBase', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$ResetPasswordStoreBaseActionController.startAction(
        name: 'ResetPasswordStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ResetPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ResetPasswordStoreBaseActionController.startAction(
        name: 'ResetPasswordStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ResetPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
loading: ${loading},
emailNotEmpty: ${emailNotEmpty}
    ''';
  }
}
