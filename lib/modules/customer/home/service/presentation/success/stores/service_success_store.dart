


import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:open_file/open_file.dart';

part 'service_success_store.g.dart';

class ServiceSuccessStore = ServiceSuccessStoreBase with _$ServiceSuccessStore;

abstract class ServiceSuccessStoreBase with Store {

  @observable
  bool showMore = true;

  @action
  setShowMore() => showMore = !showMore;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  openFile(File file) async {

    try{

      setLoading(true);

      await OpenFile.open(file.path);

    } catch(e) { print(e); } finally { setLoading(false); }

  }
}