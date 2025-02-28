// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_waiting_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderWaitingDetailsStore on OrderWaitingDetailsStoreBase, Store {
  late final _$showMoreAtom =
      Atom(name: 'OrderWaitingDetailsStoreBase.showMore', context: context);

  @override
  bool get showMore {
    _$showMoreAtom.reportRead();
    return super.showMore;
  }

  @override
  set showMore(bool value) {
    _$showMoreAtom.reportWrite(value, super.showMore, () {
      super.showMore = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'OrderWaitingDetailsStoreBase.loading', context: context);

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

  late final _$cancelOrderAsyncAction =
      AsyncAction('OrderWaitingDetailsStoreBase.cancelOrder', context: context);

  @override
  Future cancelOrder({required OrderEntity order, required dynamic context}) {
    return _$cancelOrderAsyncAction
        .run(() => super.cancelOrder(order: order, context: context));
  }

  late final _$OrderWaitingDetailsStoreBaseActionController =
      ActionController(name: 'OrderWaitingDetailsStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$OrderWaitingDetailsStoreBaseActionController
        .startAction(name: 'OrderWaitingDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$OrderWaitingDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowMore() {
    final _$actionInfo = _$OrderWaitingDetailsStoreBaseActionController
        .startAction(name: 'OrderWaitingDetailsStoreBase.setShowMore');
    try {
      return super.setShowMore();
    } finally {
      _$OrderWaitingDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showMore: ${showMore},
loading: ${loading}
    ''';
  }
}
