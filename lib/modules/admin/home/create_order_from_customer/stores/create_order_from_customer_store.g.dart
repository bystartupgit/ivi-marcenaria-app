// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_from_customer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateOrderFromCustomerStore
    on CreateOrderFromCustomerStoreBase, Store {
  late final _$currentStepAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.currentStep', context: context);

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  late final _$selectedCustomerAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.selectedCustomer',
      context: context);

  @override
  CustomerUserEntity? get selectedCustomer {
    _$selectedCustomerAtom.reportRead();
    return super.selectedCustomer;
  }

  @override
  set selectedCustomer(CustomerUserEntity? value) {
    _$selectedCustomerAtom.reportWrite(value, super.selectedCustomer, () {
      super.selectedCustomer = value;
    });
  }

  late final _$createdOrderAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.createdOrder', context: context);

  @override
  OrderEntity? get createdOrder {
    _$createdOrderAtom.reportRead();
    return super.createdOrder;
  }

  @override
  set createdOrder(OrderEntity? value) {
    _$createdOrderAtom.reportWrite(value, super.createdOrder, () {
      super.createdOrder = value;
    });
  }

  late final _$debounceAtom =
      Atom(name: 'CreateOrderFromCustomerStoreBase.debounce', context: context);

  @override
  Timer? get debounce {
    _$debounceAtom.reportRead();
    return super.debounce;
  }

  @override
  set debounce(Timer? value) {
    _$debounceAtom.reportWrite(value, super.debounce, () {
      super.debounce = value;
    });
  }

  late final _$searchNameAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.searchName', context: context);

  @override
  String get searchName {
    _$searchNameAtom.reportRead();
    return super.searchName;
  }

  @override
  set searchName(String value) {
    _$searchNameAtom.reportWrite(value, super.searchName, () {
      super.searchName = value;
    });
  }

  late final _$pageAtom =
      Atom(name: 'CreateOrderFromCustomerStoreBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$limitAtom =
      Atom(name: 'CreateOrderFromCustomerStoreBase.limit', context: context);

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$customersAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.customers', context: context);

  @override
  ObservableList<CustomerUserEntity> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(ObservableList<CustomerUserEntity> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'CreateOrderFromCustomerStoreBase.loading', context: context);

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

  late final _$orderTitleAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.orderTitle', context: context);

  @override
  String get orderTitle {
    _$orderTitleAtom.reportRead();
    return super.orderTitle;
  }

  @override
  set orderTitle(String value) {
    _$orderTitleAtom.reportWrite(value, super.orderTitle, () {
      super.orderTitle = value;
    });
  }

  late final _$orderDescriptionAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.orderDescription',
      context: context);

  @override
  String get orderDescription {
    _$orderDescriptionAtom.reportRead();
    return super.orderDescription;
  }

  @override
  set orderDescription(String value) {
    _$orderDescriptionAtom.reportWrite(value, super.orderDescription, () {
      super.orderDescription = value;
    });
  }

  late final _$environmentsAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.environments', context: context);

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

  late final _$whatsappAtom =
      Atom(name: 'CreateOrderFromCustomerStoreBase.whatsapp', context: context);

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

  late final _$customerNameAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.customerName', context: context);

  @override
  String get customerName {
    _$customerNameAtom.reportRead();
    return super.customerName;
  }

  @override
  set customerName(String value) {
    _$customerNameAtom.reportWrite(value, super.customerName, () {
      super.customerName = value;
    });
  }

  late final _$customerEmailAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.customerEmail', context: context);

  @override
  String get customerEmail {
    _$customerEmailAtom.reportRead();
    return super.customerEmail;
  }

  @override
  set customerEmail(String value) {
    _$customerEmailAtom.reportWrite(value, super.customerEmail, () {
      super.customerEmail = value;
    });
  }

  late final _$customerPhoneAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.customerPhone', context: context);

  @override
  String get customerPhone {
    _$customerPhoneAtom.reportRead();
    return super.customerPhone;
  }

  @override
  set customerPhone(String value) {
    _$customerPhoneAtom.reportWrite(value, super.customerPhone, () {
      super.customerPhone = value;
    });
  }

  late final _$customerCpfAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.customerCpf', context: context);

  @override
  String get customerCpf {
    _$customerCpfAtom.reportRead();
    return super.customerCpf;
  }

  @override
  set customerCpf(String value) {
    _$customerCpfAtom.reportWrite(value, super.customerCpf, () {
      super.customerCpf = value;
    });
  }

  late final _$customerPasswordAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.customerPassword',
      context: context);

  @override
  String get customerPassword {
    _$customerPasswordAtom.reportRead();
    return super.customerPassword;
  }

  @override
  set customerPassword(String value) {
    _$customerPasswordAtom.reportWrite(value, super.customerPassword, () {
      super.customerPassword = value;
    });
  }

  late final _$showCreateCustomerModalAtom = Atom(
      name: 'CreateOrderFromCustomerStoreBase.showCreateCustomerModal',
      context: context);

  @override
  bool get showCreateCustomerModal {
    _$showCreateCustomerModalAtom.reportRead();
    return super.showCreateCustomerModal;
  }

  @override
  set showCreateCustomerModal(bool value) {
    _$showCreateCustomerModalAtom
        .reportWrite(value, super.showCreateCustomerModal, () {
      super.showCreateCustomerModal = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('CreateOrderFromCustomerStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$loadCustomersAsyncAction = AsyncAction(
      'CreateOrderFromCustomerStoreBase.loadCustomers',
      context: context);

  @override
  Future loadCustomers() {
    return _$loadCustomersAsyncAction.run(() => super.loadCustomers());
  }

  late final _$loadMoreCustomersAsyncAction = AsyncAction(
      'CreateOrderFromCustomerStoreBase.loadMoreCustomers',
      context: context);

  @override
  Future loadMoreCustomers() {
    return _$loadMoreCustomersAsyncAction.run(() => super.loadMoreCustomers());
  }

  late final _$createCustomerAsyncAction = AsyncAction(
      'CreateOrderFromCustomerStoreBase.createCustomer',
      context: context);

  @override
  Future createCustomer(BuildContext modalContext, BuildContext pageContext) {
    return _$createCustomerAsyncAction
        .run(() => super.createCustomer(modalContext, pageContext));
  }

  late final _$createOrderAsyncAction = AsyncAction(
      'CreateOrderFromCustomerStoreBase.createOrder',
      context: context);

  @override
  Future createOrder(BuildContext context) {
    return _$createOrderAsyncAction.run(() => super.createOrder(context));
  }

  late final _$CreateOrderFromCustomerStoreBaseActionController =
      ActionController(
          name: 'CreateOrderFromCustomerStoreBase', context: context);

  @override
  dynamic setCurrentStep(int value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setCurrentStep');
    try {
      return super.setCurrentStep(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedCustomer(CustomerUserEntity? value) {
    final _$actionInfo =
        _$CreateOrderFromCustomerStoreBaseActionController.startAction(
            name: 'CreateOrderFromCustomerStoreBase.setSelectedCustomer');
    try {
      return super.setSelectedCustomer(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCreatedOrder(OrderEntity? value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setCreatedOrder');
    try {
      return super.setCreatedOrder(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOrderTitle(String value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setOrderTitle');
    try {
      return super.setOrderTitle(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOrderDescription(String value) {
    final _$actionInfo =
        _$CreateOrderFromCustomerStoreBaseActionController.startAction(
            name: 'CreateOrderFromCustomerStoreBase.setOrderDescription');
    try {
      return super.setOrderDescription(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic addEnvironment(String value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.addEnvironment');
    try {
      return super.addEnvironment(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeEnvironment(String value) {
    final _$actionInfo =
        _$CreateOrderFromCustomerStoreBaseActionController.startAction(
            name: 'CreateOrderFromCustomerStoreBase.removeEnvironment');
    try {
      return super.removeEnvironment(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWhatsapp(bool? value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setWhatsapp');
    try {
      return super.setWhatsapp(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomerName(String value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setCustomerName');
    try {
      return super.setCustomerName(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomerEmail(String value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setCustomerEmail');
    try {
      return super.setCustomerEmail(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomerPhone(String value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setCustomerPhone');
    try {
      return super.setCustomerPhone(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomerCpf(String value) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setCustomerCpf');
    try {
      return super.setCustomerCpf(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomerPassword(String value) {
    final _$actionInfo =
        _$CreateOrderFromCustomerStoreBaseActionController.startAction(
            name: 'CreateOrderFromCustomerStoreBase.setCustomerPassword');
    try {
      return super.setCustomerPassword(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowCreateCustomerModal(bool value) {
    final _$actionInfo =
        _$CreateOrderFromCustomerStoreBaseActionController.startAction(
            name:
                'CreateOrderFromCustomerStoreBase.setShowCreateCustomerModal');
    try {
      return super.setShowCreateCustomerModal(value);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchFilter(String value, BuildContext context) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.setSearchFilter');
    try {
      return super.setSearchFilter(value, context);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectCustomer(CustomerUserEntity customer) {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.selectCustomer');
    try {
      return super.selectCustomer(customer);
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic goBack() {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.goBack');
    try {
      return super.goBack();
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$CreateOrderFromCustomerStoreBaseActionController
        .startAction(name: 'CreateOrderFromCustomerStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$CreateOrderFromCustomerStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStep: ${currentStep},
selectedCustomer: ${selectedCustomer},
createdOrder: ${createdOrder},
debounce: ${debounce},
searchName: ${searchName},
page: ${page},
limit: ${limit},
customers: ${customers},
loading: ${loading},
orderTitle: ${orderTitle},
orderDescription: ${orderDescription},
environments: ${environments},
whatsapp: ${whatsapp},
customerName: ${customerName},
customerEmail: ${customerEmail},
customerPhone: ${customerPhone},
customerCpf: ${customerCpf},
customerPassword: ${customerPassword},
showCreateCustomerModal: ${showCreateCustomerModal}
    ''';
  }
}
