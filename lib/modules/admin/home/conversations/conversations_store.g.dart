// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConversationStore on ConversationStoreBase, Store {
  Computed<List<ConversationOrderEntity>>? _$conversationFilteredComputed;

  @override
  List<ConversationOrderEntity> get conversationFiltered =>
      (_$conversationFilteredComputed ??=
              Computed<List<ConversationOrderEntity>>(
                  () => super.conversationFiltered,
                  name: 'ConversationStoreBase.conversationFiltered'))
          .value;

  late final _$conversationsAtom =
      Atom(name: 'ConversationStoreBase.conversations', context: context);

  @override
  ObservableList<ConversationOrderEntity> get conversations {
    _$conversationsAtom.reportRead();
    return super.conversations;
  }

  @override
  set conversations(ObservableList<ConversationOrderEntity> value) {
    _$conversationsAtom.reportWrite(value, super.conversations, () {
      super.conversations = value;
    });
  }

  late final _$conversationWithFilterAtom = Atom(
      name: 'ConversationStoreBase.conversationWithFilter', context: context);

  @override
  ObservableList<ConversationOrderEntity> get conversationWithFilter {
    _$conversationWithFilterAtom.reportRead();
    return super.conversationWithFilter;
  }

  @override
  set conversationWithFilter(ObservableList<ConversationOrderEntity> value) {
    _$conversationWithFilterAtom
        .reportWrite(value, super.conversationWithFilter, () {
      super.conversationWithFilter = value;
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

  late final _$debounceAtom =
      Atom(name: 'ConversationStoreBase.debounce', context: context);

  @override
  Timer? get debounce {
    _$debounceAtom.reportRead();
    return super.debounce;
  }

  @override
  set debounce(Timer? value) {
    _$debounceAtom.reportWrite(value, super.debounce, () {
      super.debounce = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'ConversationStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$pageAtom =
      Atom(name: 'ConversationStoreBase.page', context: context);

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

  late final _$limitAtom =
      Atom(name: 'ConversationStoreBase.limit', context: context);

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

  late final _$initAsyncAction =
      AsyncAction('ConversationStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
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
conversationWithFilter: ${conversationWithFilter},
loading: ${loading},
filter: ${filter},
debounce: ${debounce},
name: ${name},
page: ${page},
limit: ${limit},
conversationFiltered: ${conversationFiltered}
    ''';
  }
}
