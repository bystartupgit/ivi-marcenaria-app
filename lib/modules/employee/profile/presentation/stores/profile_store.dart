

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {

  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController documentNumber = TextEditingController();


}