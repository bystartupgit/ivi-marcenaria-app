// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentStore on PaymentStoreBase, Store {
  Computed<bool>? _$hasOptionComputed;

  @override
  bool get hasOption =>
      (_$hasOptionComputed ??= Computed<bool>(() => super.hasOption,
              name: 'PaymentStoreBase.hasOption'))
          .value;

  late final _$optionAtom =
      Atom(name: 'PaymentStoreBase.option', context: context);

  @override
  int? get option {
    _$optionAtom.reportRead();
    return super.option;
  }

  @override
  set option(int? value) {
    _$optionAtom.reportWrite(value, super.option, () {
      super.option = value;
    });
  }

  late final _$proposalIDAtom =
      Atom(name: 'PaymentStoreBase.proposalID', context: context);

  @override
  int get proposalID {
    _$proposalIDAtom.reportRead();
    return super.proposalID;
  }

  @override
  set proposalID(int value) {
    _$proposalIDAtom.reportWrite(value, super.proposalID, () {
      super.proposalID = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'PaymentStoreBase.loading', context: context);

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

  late final _$confirmPaymentAsyncAction =
      AsyncAction('PaymentStoreBase.confirmPayment', context: context);

  @override
  Future confirmPayment({required dynamic context}) {
    return _$confirmPaymentAsyncAction
        .run(() => super.confirmPayment(context: context));
  }

  late final _$PaymentStoreBaseActionController =
      ActionController(name: 'PaymentStoreBase', context: context);

  @override
  dynamic setOrderID(int value) {
    final _$actionInfo = _$PaymentStoreBaseActionController.startAction(
        name: 'PaymentStoreBase.setOrderID');
    try {
      return super.setOrderID(value);
    } finally {
      _$PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOption(int? value) {
    final _$actionInfo = _$PaymentStoreBaseActionController.startAction(
        name: 'PaymentStoreBase.setOption');
    try {
      return super.setOption(value);
    } finally {
      _$PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$PaymentStoreBaseActionController.startAction(
        name: 'PaymentStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
option: ${option},
proposalID: ${proposalID},
loading: ${loading},
hasOption: ${hasOption}
    ''';
  }
}
