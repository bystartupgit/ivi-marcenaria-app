import 'dart:io';

import 'package:marcenaria/core/data/entities/profile_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../modules/login/domain/entities/auth_entity.dart';

part 'core_store.g.dart';

class CoreStore = CoreStoreBase with _$CoreStore;

abstract class CoreStoreBase with Store {

  @observable
  AuthEntity? auth;

  @observable
  ProfileEntity? profile;

  @observable
  ObservableList<String> jobs = <String>[].asObservable();

  @action
  setJobs(List<String> value) => jobs = value.asObservable();

  @observable
  File? image;

  @observable
  String? pathImage;

  @action
  setImage(File? value) => image = value;

  @action
  setPathImage(String? value) => pathImage = value;

  @action
  setAuth(AuthEntity value) => auth = value;

  @action
  setProfile(ProfileEntity? value) => profile = value;

}