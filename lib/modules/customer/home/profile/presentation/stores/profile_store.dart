import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/entities/profile_entity.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController documentNumber = TextEditingController();

  @action
  init() async {

     ProfileEntity? profile = Modular.get<CoreStore>().profile;

     if(profile != null) {
       name.text = profile.name;
       email.text = profile.email;
       phone.text = profile.phone;
       documentNumber.text = profile.cpf;
     }
  }


}