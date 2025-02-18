// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on ChatStoreBase, Store {
  Computed<int>? _$userIDComputed;

  @override
  int get userID => (_$userIDComputed ??=
          Computed<int>(() => super.userID, name: 'ChatStoreBase.userID'))
      .value;

  late final _$loadingAtom =
      Atom(name: 'ChatStoreBase.loading', context: context);

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

  late final _$pageAtom = Atom(name: 'ChatStoreBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$limitAtom = Atom(name: 'ChatStoreBase.limit', context: context);

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

  late final _$scrollAtom =
      Atom(name: 'ChatStoreBase.scroll', context: context);

  @override
  ScrollController get scroll {
    _$scrollAtom.reportRead();
    return super.scroll;
  }

  @override
  set scroll(ScrollController value) {
    _$scrollAtom.reportWrite(value, super.scroll, () {
      super.scroll = value;
    });
  }

  late final _$messagesAtom =
      Atom(name: 'ChatStoreBase.messages', context: context);

  @override
  ObservableList<MessageEntity> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<MessageEntity> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('ChatStoreBase.sendMessage', context: context);

  @override
  Future sendMessage(String value) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(value));
  }

  late final _$initAsyncAction =
      AsyncAction('ChatStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$ChatStoreBaseActionController =
      ActionController(name: 'ChatStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ChatStoreBaseActionController.startAction(
        name: 'ChatStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPagination() {
    final _$actionInfo = _$ChatStoreBaseActionController.startAction(
        name: 'ChatStoreBase.setPagination');
    try {
      return super.setPagination();
    } finally {
      _$ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
page: ${page},
limit: ${limit},
scroll: ${scroll},
messages: ${messages},
userID: ${userID}
    ''';
  }
}
