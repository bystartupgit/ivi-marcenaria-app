


import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

part 'contract_store.g.dart';

class ContractStore = ContractStoreBase with _$ContractStore;

abstract class ContractStoreBase with Store {

  @observable
  bool check = false;

  @observable
  bool loading = true;

  @observable
  bool loadingDownload = false;

  @observable
  File? contract;

  @action
  setLoading(bool value) => loading = value;

  @action
  setLoadingDownload(bool value) => loadingDownload = value;

  @action
  setCheck(bool? value) => check = value ?? false;

  @action
  init() async {

    try {

      setLoading(true);

      Directory directory = await getTemporaryDirectory();
      File file = File("${directory.path}/contract.pdf");

      var data = await rootBundle.load("assets/login/pdf/termo.pdf");
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes);

      contract = file;

    } catch (e) { throw Exception('Error parsing asset file!'); } finally { setLoading(false); }

  }

  @action
  download() async {

    try{

      setLoadingDownload(true);

      if(contract != null) {
        await OpenFile.open(contract!.path);
      }

    } catch(e) { print(e); } finally { (setLoadingDownload(false)); }

  }


}