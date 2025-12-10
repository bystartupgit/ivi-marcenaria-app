import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/dtos/create_order_dto.dart';
import 'package:marcenaria/modules/admin/domain/entities/customer_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/create_order_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_customers_usecase.dart';
import 'package:marcenaria/modules/login/domain/dto/register_dto.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';
import 'package:marcenaria/modules/login/domain/usecases/register_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_success_message_usecase.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/success/order_success_page.dart';
import 'package:mobx/mobx.dart';

part 'create_order_from_customer_store.g.dart';

class CreateOrderFromCustomerStore = CreateOrderFromCustomerStoreBase
    with _$CreateOrderFromCustomerStore;

abstract class CreateOrderFromCustomerStoreBase with Store {
  final GetCustomersUsecase _getCustomersUsecase =
      Modular.get<GetCustomersUsecase>();
  final CreateOrderUsecase _createOrderUsecase = Modular.get<CreateOrderUsecase>();
  final RegisterUseCase _registerUseCase = Modular.get<RegisterUseCase>();

  // Etapa atual do fluxo (0: Selecionar Cliente, 1: Criar Pedido)
  @observable
  int currentStep = 0;

  @action
  setCurrentStep(int value) => currentStep = value;

  // Cliente selecionado
  @observable
  CustomerUserEntity? selectedCustomer;

  @action
  setSelectedCustomer(CustomerUserEntity? value) => selectedCustomer = value;

  // Pedido criado
  @observable
  OrderEntity? createdOrder;

  @action
  setCreatedOrder(OrderEntity? value) => createdOrder = value;

  // Busca de clientes
  ScrollController scroll = ScrollController();

  @observable
  Timer? debounce;

  @observable
  String searchName = "";

  @observable
  int page = 1;

  @observable
  int limit = 10;

  @observable
  ObservableList<CustomerUserEntity> customers =
      <CustomerUserEntity>[].asObservable();

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  // Formulário de pedido
  @observable
  String orderTitle = "";

  @action
  setOrderTitle(String value) => orderTitle = value;

  @observable
  String orderDescription = "";

  @action
  setOrderDescription(String value) => orderDescription = value;

  @observable
  ObservableList<String> environments = <String>[].asObservable();

  @action
  addEnvironment(String value) {
    print("🟢 [ENVIRONMENTS] Adicionando ambiente: '$value'");
    print("🟢 [ENVIRONMENTS] Lista antes: $environments");
    environments.add(value);
    print("🟢 [ENVIRONMENTS] Lista depois: $environments");
  }

  @action
  removeEnvironment(String value) => environments.remove(value);

  @observable
  bool whatsapp = false;

  @action
  setWhatsapp(bool? value) => value != null ? whatsapp = value : null;

  // Formulário de criação de cliente
  @observable
  String customerName = "";

  @action
  setCustomerName(String value) => customerName = value;

  @observable
  String customerEmail = "";

  @action
  setCustomerEmail(String value) => customerEmail = value;

  @observable
  String customerPhone = "";

  @action
  setCustomerPhone(String value) => customerPhone = value;

  @observable
  String customerCpf = "";

  @action
  setCustomerCpf(String value) => customerCpf = value;

  @observable
  String customerPassword = "";

  @action
  setCustomerPassword(String value) => customerPassword = value;

  @observable
  bool showCreateCustomerModal = false;

  @action
  setShowCreateCustomerModal(bool value) => showCreateCustomerModal = value;

  // Inicialização
  @action
  init() async {
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent &&
          loading == false) {
        loadMoreCustomers();
      }
    });

    await loadCustomers();
  }

  @action
  loadCustomers() async {
    setLoading(true);
    page = 1;

    List<CustomerUserEntity> result =
        await _getCustomersUsecase.call(page: page, limit: limit, name: searchName);

    customers = result.asObservable();
    setLoading(false);
  }

  @action
  loadMoreCustomers() async {
    if (customers.length / limit == page) {
      page++;
      setLoading(true);

      List<CustomerUserEntity> result = await _getCustomersUsecase.call(
          page: page, limit: limit, name: searchName);

      if (result.isNotEmpty) {
        for (CustomerUserEntity value in result) {
          if (!customers.contains(value)) {
            customers.add(value);
          }
        }
      }

      setLoading(false);
    }
  }

  @action
  setSearchFilter(String value, BuildContext context) {
    searchName = value;

    if (debounce?.isActive ?? false) debounce?.cancel();

    debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        setLoading(true);
        page = 1;

        List<CustomerUserEntity> result = await _getCustomersUsecase.call(
            page: page, limit: limit, name: searchName);

        customers = result.asObservable();
      } catch (e) {
        ShowErrorMessageUsecase(context: context)
            .call(message: "Não foi possível pesquisar clientes.");
      } finally {
        setLoading(false);
      }
    });
  }

  @action
  selectCustomer(CustomerUserEntity customer) {
    setSelectedCustomer(customer);
    setCurrentStep(1); // Vai para etapa de criar pedido
  }

  @action
  createCustomer(BuildContext modalContext, BuildContext pageContext) async {
    try {
      setLoading(true);

      (String, bool) result = await _registerUseCase.call(
          dto: RegisterDTO(
              name: customerName,
              email: customerEmail,
              password: customerPassword,
              cpf: customerCpf,
              phone: customerPhone,
              functions: [],
              type: UserType.cliente));

      if (result.$2) {
        // Recarrega lista de clientes
        await loadCustomers();
        // Limpa formulário
        customerName = "";
        customerEmail = "";
        customerPhone = "";
        customerCpf = "";
        customerPassword = "";
        
        // Fecha o modal de criação de cliente
        setShowCreateCustomerModal(false);
        
        // Fecha o dialog do modal
        if (modalContext.mounted) {
          Navigator.of(modalContext).pop();
        }
        
        // Aguarda um frame para garantir que o modal foi fechado
        await Future.delayed(const Duration(milliseconds: 100));
        
        // Mostra mensagem de sucesso e aguarda o usuário fechar o dialog
        await ShowSuccessMessageUsecase(context: pageContext).call(
          message: "Cliente criado com sucesso!",
        );
        
        // Após fechar o dialog, retorna para a NavigationPage
        if (pageContext.mounted) {
          Modular.to.pop();
        }
      } else {
        ShowErrorMessageUsecase(context: modalContext).call(message: result.$1);
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: modalContext).call(message: e.toString());
    } finally {
      setLoading(false);
    }
  }

  @action
  createOrder(BuildContext context) async {
    if (selectedCustomer == null) {
      ShowErrorMessageUsecase(context: context)
          .call(message: "Selecione um cliente primeiro.");
      return;
    }

    if (orderTitle.isEmpty || orderDescription.isEmpty) {
      ShowErrorMessageUsecase(context: context)
          .call(message: "Preencha título e descrição do Orçamento.");
      return;
    }

    try {
      setLoading(true);

      String environmentsString = environments.join(',');
      print("🔵 [CREATE_ORDER_STORE] Ambientes coletados: ${environments.length} itens");
      print("🔵 [CREATE_ORDER_STORE] Lista de ambientes: $environments");
      print("🔵 [CREATE_ORDER_STORE] String de ambientes: '$environmentsString'");

      CreateOrderDTO dto = CreateOrderDTO(
        customerID: selectedCustomer!.customerID,
        title: orderTitle,
        description: orderDescription,
        environments: environmentsString,
        whatsapp: whatsapp,
      );

      

      (String, OrderEntity?) result = await _createOrderUsecase.call(dto: dto);

     
      if (result.$2 != null) {
      }

      if (result.$2 != null) {
        // Salva o pedido criado no store
        setCreatedOrder(result.$2);
        
        // Limpa o formulário após sucesso
        orderTitle = "";
        orderDescription = "";
        environments.clear();
        whatsapp = false;
        
        // Desabilita o loading antes de navegar
        setLoading(false);
        
        // Aguarda um frame para garantir que a UI seja atualizada
        await Future.delayed(const Duration(milliseconds: 100));
        
        // Navega para a página de sucesso usando Navigator diretamente
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OrderSuccessPage(),
            ),
          );
        }
      } else {
        print("❌ [CREATE_ORDER_STORE] Erro ao criar pedido: ${result.$1}");
        setLoading(false);
        ShowErrorMessageUsecase(context: context).call(message: result.$1);
      }
    } catch (e) {
      setLoading(false);
      ShowErrorMessageUsecase(context: context).call(message: e.toString());
    }
  }

  @action
  goBack() {
    if (currentStep > 0) {
      setCurrentStep(currentStep - 1);
    } else {
      Modular.to.pop();
    }
  }

  @action
  reset() {
    currentStep = 0;
    selectedCustomer = null;
    createdOrder = null;
    orderTitle = "";
    orderDescription = "";
    environments.clear();
    whatsapp = false;
  }

  void dispose() {
    scroll.dispose();
    debounce?.cancel();
  }
}

