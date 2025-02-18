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

  late final _$mediaAtom =
      Atom(name: 'OrderWaitingDetailsStoreBase.media', context: context);

  @override
  MediaEntity? get media {
    _$mediaAtom.reportRead();
    return super.media;
  }

  @override
  set media(MediaEntity? value) {
    _$mediaAtom.reportWrite(value, super.media, () {
      super.media = value;
    });
  }

  late final _$fileAtom =
      Atom(name: 'OrderWaitingDetailsStoreBase.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('OrderWaitingDetailsStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$downloadMediaAsyncAction = AsyncAction(
      'OrderWaitingDetailsStoreBase.downloadMedia',
      context: context);

  @override
  Future downloadMedia() {
    return _$downloadMediaAsyncAction.run(() => super.downloadMedia());
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
loading: ${loading},
media: ${media},
file: ${file}
    ''';
  }
}
