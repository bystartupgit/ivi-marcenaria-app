// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_proposal_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderProposalDetailsStore on OrderProposalDetailsStoreBase, Store {
  late final _$showMoreAtom =
      Atom(name: 'OrderProposalDetailsStoreBase.showMore', context: context);

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
      Atom(name: 'OrderProposalDetailsStoreBase.loading', context: context);

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
      Atom(name: 'OrderProposalDetailsStoreBase.media', context: context);

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
      Atom(name: 'OrderProposalDetailsStoreBase.file', context: context);

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
      AsyncAction('OrderProposalDetailsStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$downloadMediaAsyncAction = AsyncAction(
      'OrderProposalDetailsStoreBase.downloadMedia',
      context: context);

  @override
  Future downloadMedia() {
    return _$downloadMediaAsyncAction.run(() => super.downloadMedia());
  }

  late final _$cancelOrderAsyncAction = AsyncAction(
      'OrderProposalDetailsStoreBase.cancelOrder',
      context: context);

  @override
  Future cancelOrder(
      {required ProposalEntity order, required dynamic context}) {
    return _$cancelOrderAsyncAction
        .run(() => super.cancelOrder(order: order, context: context));
  }

  late final _$OrderProposalDetailsStoreBaseActionController =
      ActionController(name: 'OrderProposalDetailsStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$OrderProposalDetailsStoreBaseActionController
        .startAction(name: 'OrderProposalDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$OrderProposalDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowMore() {
    final _$actionInfo = _$OrderProposalDetailsStoreBaseActionController
        .startAction(name: 'OrderProposalDetailsStoreBase.setShowMore');
    try {
      return super.setShowMore();
    } finally {
      _$OrderProposalDetailsStoreBaseActionController.endAction(_$actionInfo);
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
