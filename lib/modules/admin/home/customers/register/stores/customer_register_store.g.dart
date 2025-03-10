// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerRegisterStore on CustomerRegisterStoreBase, Store {
  late final _$indexAtom =
      Atom(name: 'CustomerRegisterStoreBase.index', context: context);

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

  late final _$loadingAtom =
      Atom(name: 'CustomerRegisterStoreBase.loading', context: context);

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

  late final _$jobsAtom =
      Atom(name: 'CustomerRegisterStoreBase.jobs', context: context);

  @override
  ObservableList<String> get jobs {
    _$jobsAtom.reportRead();
    return super.jobs;
  }

  @override
  set jobs(ObservableList<String> value) {
    _$jobsAtom.reportWrite(value, super.jobs, () {
      super.jobs = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'CustomerRegisterStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'CustomerRegisterStoreBase.name', context: context);

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

  late final _$phoneAtom =
      Atom(name: 'CustomerRegisterStoreBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'CustomerRegisterStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: 'CustomerRegisterStoreBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('CustomerRegisterStoreBase.register', context: context);

  @override
  Future<void> register({required dynamic context}) {
    return _$registerAsyncAction.run(() => super.register(context: context));
  }

  late final _$CustomerRegisterStoreBaseActionController =
      ActionController(name: 'CustomerRegisterStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$CustomerRegisterStoreBaseActionController
        .startAction(name: 'CustomerRegisterStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$CustomerRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addJob(String value) {
    final _$actionInfo = _$CustomerRegisterStoreBaseActionController
        .startAction(name: 'CustomerRegisterStoreBase.addJob');
    try {
      return super.addJob(value);
    } finally {
      _$CustomerRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeJob(String value) {
    final _$actionInfo = _$CustomerRegisterStoreBaseActionController
        .startAction(name: 'CustomerRegisterStoreBase.removeJob');
    try {
      return super.removeJob(value);
    } finally {
      _$CustomerRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$CustomerRegisterStoreBaseActionController
        .startAction(name: 'CustomerRegisterStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$CustomerRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$CustomerRegisterStoreBaseActionController
        .startAction(name: 'CustomerRegisterStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$CustomerRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String value) {
    final _$actionInfo = _$CustomerRegisterStoreBaseActionController
        .startAction(name: 'CustomerRegisterStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$CustomerRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$CustomerRegisterStoreBaseActionController
        .startAction(name: 'CustomerRegisterStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$CustomerRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCPF(String value) {
    final _$actionInfo = _$CustomerRegisterStoreBaseActionController
        .startAction(name: 'CustomerRegisterStoreBase.setCPF');
    try {
      return super.setCPF(value);
    } finally {
      _$CustomerRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
loading: ${loading},
jobs: ${jobs},
email: ${email},
name: ${name},
phone: ${phone},
password: ${password},
cpf: ${cpf}
    ''';
  }
}
