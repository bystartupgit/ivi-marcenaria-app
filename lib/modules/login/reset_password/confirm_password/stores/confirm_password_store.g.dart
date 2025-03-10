// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmPasswordStore on ConfirmPasswordStoreBase, Store {
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: 'ConfirmPasswordStoreBase.passwordValid'))
          .value;

  late final _$passwordAtom =
      Atom(name: 'ConfirmPasswordStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'ConfirmPasswordStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ConfirmPasswordStoreBase.loading', context: context);

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

  late final _$confirmationPasswordAsyncAction = AsyncAction(
      'ConfirmPasswordStoreBase.confirmationPassword',
      context: context);

  @override
  Future confirmationPassword(
      {required dynamic context, required String code}) {
    return _$confirmationPasswordAsyncAction
        .run(() => super.confirmationPassword(context: context, code: code));
  }

  late final _$ConfirmPasswordStoreBaseActionController =
      ActionController(name: 'ConfirmPasswordStoreBase', context: context);

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$ConfirmPasswordStoreBaseActionController.startAction(
        name: 'ConfirmPasswordStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$ConfirmPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmPassword(String value) {
    final _$actionInfo = _$ConfirmPasswordStoreBaseActionController.startAction(
        name: 'ConfirmPasswordStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$ConfirmPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ConfirmPasswordStoreBaseActionController.startAction(
        name: 'ConfirmPasswordStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ConfirmPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
password: ${password},
confirmPassword: ${confirmPassword},
loading: ${loading},
passwordValid: ${passwordValid}
    ''';
  }
}
