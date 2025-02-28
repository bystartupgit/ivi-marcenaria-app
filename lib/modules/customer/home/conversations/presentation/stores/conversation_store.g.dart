// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConversationStore on ConversationStoreBase, Store {
  late final _$conversationsAtom =
      Atom(name: 'ConversationStoreBase.conversations', context: context);

  @override
  ObservableList<String> get conversations {
    _$conversationsAtom.reportRead();
    return super.conversations;
  }

  @override
  set conversations(ObservableList<String> value) {
    _$conversationsAtom.reportWrite(value, super.conversations, () {
      super.conversations = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ConversationStoreBase.loading', context: context);

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

  late final _$filterAtom =
      Atom(name: 'ConversationStoreBase.filter', context: context);

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

  late final _$ConversationStoreBaseActionController =
      ActionController(name: 'ConversationStoreBase', context: context);

  @override
  dynamic setloading(bool value) {
    final _$actionInfo = _$ConversationStoreBaseActionController.startAction(
        name: 'ConversationStoreBase.setloading');
    try {
      return super.setloading(value);
    } finally {
      _$ConversationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$ConversationStoreBaseActionController.startAction(
        name: 'ConversationStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$ConversationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
conversations: ${conversations},
loading: ${loading},
filter: ${filter}
    ''';
  }
}
