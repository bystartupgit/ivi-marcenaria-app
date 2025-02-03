// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceStore on ServiceStoreBase, Store {
  Computed<ServiceDTO>? _$serviceComputed;

  @override
  ServiceDTO get service =>
      (_$serviceComputed ??= Computed<ServiceDTO>(() => super.service,
              name: 'ServiceStoreBase.service'))
          .value;

  late final _$loadingAtom =
      Atom(name: 'ServiceStoreBase.loading', context: context);

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

  late final _$indexAtom =
      Atom(name: 'ServiceStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$nameAtom = Atom(name: 'ServiceStoreBase.name', context: context);

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

  late final _$environmentsAtom =
      Atom(name: 'ServiceStoreBase.environments', context: context);

  @override
  ObservableList<String> get environments {
    _$environmentsAtom.reportRead();
    return super.environments;
  }

  @override
  set environments(ObservableList<String> value) {
    _$environmentsAtom.reportWrite(value, super.environments, () {
      super.environments = value;
    });
  }

  late final _$observationsAtom =
      Atom(name: 'ServiceStoreBase.observations', context: context);

  @override
  String get observations {
    _$observationsAtom.reportRead();
    return super.observations;
  }

  @override
  set observations(String value) {
    _$observationsAtom.reportWrite(value, super.observations, () {
      super.observations = value;
    });
  }

  late final _$whatsappAtom =
      Atom(name: 'ServiceStoreBase.whatsapp', context: context);

  @override
  bool get whatsapp {
    _$whatsappAtom.reportRead();
    return super.whatsapp;
  }

  @override
  set whatsapp(bool value) {
    _$whatsappAtom.reportWrite(value, super.whatsapp, () {
      super.whatsapp = value;
    });
  }

  late final _$typeAtom = Atom(name: 'ServiceStoreBase.type', context: context);

  @override
  int get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(int value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$coverAtom =
      Atom(name: 'ServiceStoreBase.cover', context: context);

  @override
  (String, CoverType) get cover {
    _$coverAtom.reportRead();
    return super.cover;
  }

  @override
  set cover((String, CoverType) value) {
    _$coverAtom.reportWrite(value, super.cover, () {
      super.cover = value;
    });
  }

  late final _$coverFilesAtom =
      Atom(name: 'ServiceStoreBase.coverFiles', context: context);

  @override
  ObservableList<File> get coverFiles {
    _$coverFilesAtom.reportRead();
    return super.coverFiles;
  }

  @override
  set coverFiles(ObservableList<File> value) {
    _$coverFilesAtom.reportWrite(value, super.coverFiles, () {
      super.coverFiles = value;
    });
  }

  late final _$serviceFileAtom =
      Atom(name: 'ServiceStoreBase.serviceFile', context: context);

  @override
  File? get serviceFile {
    _$serviceFileAtom.reportRead();
    return super.serviceFile;
  }

  @override
  set serviceFile(File? value) {
    _$serviceFileAtom.reportWrite(value, super.serviceFile, () {
      super.serviceFile = value;
    });
  }

  late final _$goToDetailsPageAsyncAction =
      AsyncAction('ServiceStoreBase.goToDetailsPage', context: context);

  @override
  Future goToDetailsPage({required dynamic context}) {
    return _$goToDetailsPageAsyncAction
        .run(() => super.goToDetailsPage(context: context));
  }

  late final _$saveServiceAsyncAction =
      AsyncAction('ServiceStoreBase.saveService', context: context);

  @override
  Future saveService({required dynamic context}) {
    return _$saveServiceAsyncAction
        .run(() => super.saveService(context: context));
  }

  late final _$addCoverFileAsyncAction =
      AsyncAction('ServiceStoreBase.addCoverFile', context: context);

  @override
  Future addCoverFile({required dynamic context}) {
    return _$addCoverFileAsyncAction
        .run(() => super.addCoverFile(context: context));
  }

  late final _$addServiceFileAsyncAction =
      AsyncAction('ServiceStoreBase.addServiceFile', context: context);

  @override
  Future addServiceFile({required dynamic context}) {
    return _$addServiceFileAsyncAction
        .run(() => super.addServiceFile(context: context));
  }

  late final _$ServiceStoreBaseActionController =
      ActionController(name: 'ServiceStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addEnvironment(String value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.addEnvironment');
    try {
      return super.addEnvironment(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeEnvironment(String value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.removeEnvironment');
    try {
      return super.removeEnvironment(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObservations(String value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.setObservations');
    try {
      return super.setObservations(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWhatsApp(bool? value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.setWhatsApp');
    try {
      return super.setWhatsApp(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setType(int value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCover((String, CoverType) value) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.setCover');
    try {
      return super.setCover(value);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ServiceAttachmentDTO coverDTO({required int orderID}) {
    final _$actionInfo = _$ServiceStoreBaseActionController.startAction(
        name: 'ServiceStoreBase.coverDTO');
    try {
      return super.coverDTO(orderID: orderID);
    } finally {
      _$ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
index: ${index},
name: ${name},
environments: ${environments},
observations: ${observations},
whatsapp: ${whatsapp},
type: ${type},
cover: ${cover},
coverFiles: ${coverFiles},
serviceFile: ${serviceFile},
service: ${service}
    ''';
  }
}
