// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on ProfileStoreBase, Store {
  late final _$imageAtom =
      Atom(name: 'ProfileStoreBase.image', context: context);

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$pathImageAtom =
      Atom(name: 'ProfileStoreBase.pathImage', context: context);

  @override
  String? get pathImage {
    _$pathImageAtom.reportRead();
    return super.pathImage;
  }

  @override
  set pathImage(String? value) {
    _$pathImageAtom.reportWrite(value, super.pathImage, () {
      super.pathImage = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ProfileStoreBase.loading', context: context);

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
      AsyncAction('ProfileStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$uploadImageAsyncAction =
      AsyncAction('ProfileStoreBase.uploadImage', context: context);

  @override
  Future uploadImage({required dynamic context}) {
    return _$uploadImageAsyncAction
        .run(() => super.uploadImage(context: context));
  }

  late final _$getProfilePhotoAsyncAction =
      AsyncAction('ProfileStoreBase.getProfilePhoto', context: context);

  @override
  Future<bool> getProfilePhoto({required dynamic context}) {
    return _$getProfilePhotoAsyncAction
        .run(() => super.getProfilePhoto(context: context));
  }

  late final _$ProfileStoreBaseActionController =
      ActionController(name: 'ProfileStoreBase', context: context);

  @override
  dynamic setImage(File value) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update(ProfileDTO dto) {
    final _$actionInfo = _$ProfileStoreBaseActionController.startAction(
        name: 'ProfileStoreBase.update');
    try {
      return super.update(dto);
    } finally {
      _$ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
pathImage: ${pathImage},
loading: ${loading}
    ''';
  }
}
