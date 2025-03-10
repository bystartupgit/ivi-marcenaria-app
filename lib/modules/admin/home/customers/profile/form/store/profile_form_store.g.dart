// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileFormStore on ProfileFormStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: 'ProfileFormStoreBase.loading', context: context);

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

  late final _$imageAtom =
      Atom(name: 'ProfileFormStoreBase.image', context: context);

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
      Atom(name: 'ProfileFormStoreBase.pathImage', context: context);

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

  late final _$uploadImageAsyncAction =
      AsyncAction('ProfileFormStoreBase.uploadImage', context: context);

  @override
  Future uploadImage({required dynamic context, required int id}) {
    return _$uploadImageAsyncAction
        .run(() => super.uploadImage(context: context, id: id));
  }

  late final _$getProfilePhotoAsyncAction =
      AsyncAction('ProfileFormStoreBase.getProfilePhoto', context: context);

  @override
  Future<bool> getProfilePhoto({required dynamic context}) {
    return _$getProfilePhotoAsyncAction
        .run(() => super.getProfilePhoto(context: context));
  }

  late final _$initAsyncAction =
      AsyncAction('ProfileFormStoreBase.init', context: context);

  @override
  Future init({required CustomerUserEntity customer}) {
    return _$initAsyncAction.run(() => super.init(customer: customer));
  }

  late final _$updateAsyncAction =
      AsyncAction('ProfileFormStoreBase.update', context: context);

  @override
  Future update({required dynamic context, required int id}) {
    return _$updateAsyncAction
        .run(() => super.update(context: context, id: id));
  }

  late final _$ProfileFormStoreBaseActionController =
      ActionController(name: 'ProfileFormStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ProfileFormStoreBaseActionController.startAction(
        name: 'ProfileFormStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ProfileFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImage(File? value) {
    final _$actionInfo = _$ProfileFormStoreBaseActionController.startAction(
        name: 'ProfileFormStoreBase.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$ProfileFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
image: ${image},
pathImage: ${pathImage}
    ''';
  }
}
