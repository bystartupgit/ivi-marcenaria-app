// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_proposal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateProposalStore on CreateProposalStoreBase, Store {
  late final _$orderAtom =
      Atom(name: 'CreateProposalStoreBase.order', context: context);

  @override
  OrderWithoutProposalEntity? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderWithoutProposalEntity? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'CreateProposalStoreBase.loading', context: context);

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

  late final _$showMoreAtom =
      Atom(name: 'CreateProposalStoreBase.showMore', context: context);

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

  late final _$initAsyncAction =
      AsyncAction('CreateProposalStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$CreateProposalStoreBaseActionController =
      ActionController(name: 'CreateProposalStoreBase', context: context);

  @override
  dynamic setShowMore() {
    final _$actionInfo = _$CreateProposalStoreBaseActionController.startAction(
        name: 'CreateProposalStoreBase.setShowMore');
    try {
      return super.setShowMore();
    } finally {
      _$CreateProposalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$CreateProposalStoreBaseActionController.startAction(
        name: 'CreateProposalStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$CreateProposalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
order: ${order},
loading: ${loading},
showMore: ${showMore}
    ''';
  }
}
