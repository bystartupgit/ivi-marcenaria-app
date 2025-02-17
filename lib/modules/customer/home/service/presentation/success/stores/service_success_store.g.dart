// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_success_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceSuccessStore on ServiceSuccessStoreBase, Store {
  late final _$showMoreAtom =
      Atom(name: 'ServiceSuccessStoreBase.showMore', context: context);

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

  late final _$ServiceSuccessStoreBaseActionController =
      ActionController(name: 'ServiceSuccessStoreBase', context: context);

  @override
  dynamic setShowMore() {
    final _$actionInfo = _$ServiceSuccessStoreBaseActionController.startAction(
        name: 'ServiceSuccessStoreBase.setShowMore');
    try {
      return super.setShowMore();
    } finally {
      _$ServiceSuccessStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showMore: ${showMore}
    ''';
  }
}
