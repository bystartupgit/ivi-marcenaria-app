// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waiting_interesting_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WaitingInterestingDetailsStore
    on WaitingInterestingDetailsStoreBase, Store {
  late final _$orderAtom =
      Atom(name: 'WaitingInterestingDetailsStoreBase.order', context: context);

  @override
  OrderEntity? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderEntity? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$proposalAtom = Atom(
      name: 'WaitingInterestingDetailsStoreBase.proposal', context: context);

  @override
  ProposalEntity? get proposal {
    _$proposalAtom.reportRead();
    return super.proposal;
  }

  @override
  set proposal(ProposalEntity? value) {
    _$proposalAtom.reportWrite(value, super.proposal, () {
      super.proposal = value;
    });
  }

  late final _$loadingAtom = Atom(
      name: 'WaitingInterestingDetailsStoreBase.loading', context: context);

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

  late final _$initAsyncAction =
      AsyncAction('WaitingInterestingDetailsStoreBase.init', context: context);

  @override
  Future init({required int orderID}) {
    return _$initAsyncAction.run(() => super.init(orderID: orderID));
  }

  late final _$cancelProposalAsyncAction = AsyncAction(
      'WaitingInterestingDetailsStoreBase.cancelProposal',
      context: context);

  @override
  Future cancelProposal({required dynamic context}) {
    return _$cancelProposalAsyncAction
        .run(() => super.cancelProposal(context: context));
  }

  late final _$approvalProposalAsyncAction = AsyncAction(
      'WaitingInterestingDetailsStoreBase.approvalProposal',
      context: context);

  @override
  Future approvalProposal({required dynamic context}) {
    return _$approvalProposalAsyncAction
        .run(() => super.approvalProposal(context: context));
  }

  late final _$WaitingInterestingDetailsStoreBaseActionController =
      ActionController(
          name: 'WaitingInterestingDetailsStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$WaitingInterestingDetailsStoreBaseActionController
        .startAction(name: 'WaitingInterestingDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$WaitingInterestingDetailsStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
order: ${order},
proposal: ${proposal},
loading: ${loading}
    ''';
  }
}
