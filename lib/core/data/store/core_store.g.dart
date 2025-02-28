// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoreStore on CoreStoreBase, Store {
  late final _$authAtom = Atom(name: 'CoreStoreBase.auth', context: context);

  @override
  AuthEntity? get auth {
    _$authAtom.reportRead();
    return super.auth;
  }

  @override
  set auth(AuthEntity? value) {
    _$authAtom.reportWrite(value, super.auth, () {
      super.auth = value;
    });
  }

  late final _$profileAtom =
      Atom(name: 'CoreStoreBase.profile', context: context);

  @override
  ProfileEntity? get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(ProfileEntity? value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  late final _$CoreStoreBaseActionController =
      ActionController(name: 'CoreStoreBase', context: context);

  @override
  dynamic setAuth(AuthEntity value) {
    final _$actionInfo = _$CoreStoreBaseActionController.startAction(
        name: 'CoreStoreBase.setAuth');
    try {
      return super.setAuth(value);
    } finally {
      _$CoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProfile(ProfileEntity? value) {
    final _$actionInfo = _$CoreStoreBaseActionController.startAction(
        name: 'CoreStoreBase.setProfile');
    try {
      return super.setProfile(value);
    } finally {
      _$CoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
auth: ${auth},
profile: ${profile}
    ''';
  }
}
