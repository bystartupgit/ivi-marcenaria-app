// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContractStore on ContractStoreBase, Store {
  late final _$checkAtom =
      Atom(name: 'ContractStoreBase.check', context: context);

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ContractStoreBase.loading', context: context);

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

  late final _$loadingDownloadAtom =
      Atom(name: 'ContractStoreBase.loadingDownload', context: context);

  @override
  bool get loadingDownload {
    _$loadingDownloadAtom.reportRead();
    return super.loadingDownload;
  }

  @override
  set loadingDownload(bool value) {
    _$loadingDownloadAtom.reportWrite(value, super.loadingDownload, () {
      super.loadingDownload = value;
    });
  }

  late final _$contractAtom =
      Atom(name: 'ContractStoreBase.contract', context: context);

  @override
  File? get contract {
    _$contractAtom.reportRead();
    return super.contract;
  }

  @override
  set contract(File? value) {
    _$contractAtom.reportWrite(value, super.contract, () {
      super.contract = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('ContractStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$downloadAsyncAction =
      AsyncAction('ContractStoreBase.download', context: context);

  @override
  Future download() {
    return _$downloadAsyncAction.run(() => super.download());
  }

  late final _$ContractStoreBaseActionController =
      ActionController(name: 'ContractStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ContractStoreBaseActionController.startAction(
        name: 'ContractStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ContractStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoadingDownload(bool value) {
    final _$actionInfo = _$ContractStoreBaseActionController.startAction(
        name: 'ContractStoreBase.setLoadingDownload');
    try {
      return super.setLoadingDownload(value);
    } finally {
      _$ContractStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCheck(bool? value) {
    final _$actionInfo = _$ContractStoreBaseActionController.startAction(
        name: 'ContractStoreBase.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$ContractStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
check: ${check},
loading: ${loading},
loadingDownload: ${loadingDownload},
contract: ${contract}
    ''';
  }
}
