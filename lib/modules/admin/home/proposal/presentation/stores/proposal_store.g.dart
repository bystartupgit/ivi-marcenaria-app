// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProposalStore on ProposalStoreBase, Store {
  Computed<List<OrderEntity>>? _$waitingProposalFilteredComputed;

  @override
  List<OrderEntity> get waitingProposalFiltered =>
      (_$waitingProposalFilteredComputed ??= Computed<List<OrderEntity>>(
              () => super.waitingProposalFiltered,
              name: 'ProposalStoreBase.waitingProposalFiltered'))
          .value;
  Computed<List<OrderEntity>>? _$waitingAprovalFilteredComputed;

  @override
  List<OrderEntity> get waitingAprovalFiltered =>
      (_$waitingAprovalFilteredComputed ??= Computed<List<OrderEntity>>(
              () => super.waitingAprovalFiltered,
              name: 'ProposalStoreBase.waitingAprovalFiltered'))
          .value;

  late final _$indexAtom =
      Atom(name: 'ProposalStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$pageWaitingAtom =
      Atom(name: 'ProposalStoreBase.pageWaiting', context: context);

  @override
  int get pageWaiting {
    _$pageWaitingAtom.reportRead();
    return super.pageWaiting;
  }

  @override
  set pageWaiting(int value) {
    _$pageWaitingAtom.reportWrite(value, super.pageWaiting, () {
      super.pageWaiting = value;
    });
  }

  late final _$limitAtom =
      Atom(name: 'ProposalStoreBase.limit', context: context);

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$filterAtom =
      Atom(name: 'ProposalStoreBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ProposalStoreBase.loading', context: context);

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

  late final _$waitingProposalAtom =
      Atom(name: 'ProposalStoreBase.waitingProposal', context: context);

  @override
  ObservableList<OrderEntity> get waitingProposal {
    _$waitingProposalAtom.reportRead();
    return super.waitingProposal;
  }

  @override
  set waitingProposal(ObservableList<OrderEntity> value) {
    _$waitingProposalAtom.reportWrite(value, super.waitingProposal, () {
      super.waitingProposal = value;
    });
  }

  late final _$waitingAprovalAtom =
      Atom(name: 'ProposalStoreBase.waitingAproval', context: context);

  @override
  ObservableList<OrderEntity> get waitingAproval {
    _$waitingAprovalAtom.reportRead();
    return super.waitingAproval;
  }

  @override
  set waitingAproval(ObservableList<OrderEntity> value) {
    _$waitingAprovalAtom.reportWrite(value, super.waitingAproval, () {
      super.waitingAproval = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('ProposalStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$ProposalStoreBaseActionController =
      ActionController(name: 'ProposalStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ProposalStoreBaseActionController.startAction(
        name: 'ProposalStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ProposalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$ProposalStoreBaseActionController.startAction(
        name: 'ProposalStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$ProposalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int value) {
    final _$actionInfo = _$ProposalStoreBaseActionController.startAction(
        name: 'ProposalStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$ProposalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
pageWaiting: ${pageWaiting},
limit: ${limit},
filter: ${filter},
loading: ${loading},
waitingProposal: ${waitingProposal},
waitingAproval: ${waitingAproval},
waitingProposalFiltered: ${waitingProposalFiltered},
waitingAprovalFiltered: ${waitingAprovalFiltered}
    ''';
  }
}
