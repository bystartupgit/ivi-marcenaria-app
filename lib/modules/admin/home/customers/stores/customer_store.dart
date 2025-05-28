import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/customer_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_customers_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../login/domain/usecases/show_error_message_usecase.dart';

part 'customer_store.g.dart';

class CustomerStore = CustomerStoreBase with _$CustomerStore;

abstract class CustomerStoreBase with Store implements Disposable {
  final _getCustomers = Modular.get<GetCustomersUsecase>();

  ScrollController scroll = ScrollController();

  @observable
  Timer? debounce;

  @observable
  String name = "";

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

  @action
  addPagination() => page++;

  @action
  loadingMoreCustomers() async {
    if (customers.length / limit == page) {
      addPagination();

      setLoading(true);

      List<CustomerUserEntity> result =
          await _getCustomers.call(page: page, limit: limit, name: name);

      if (result.isNotEmpty) {
        for (CustomerUserEntity value in result) {
          if (customers.contains(value) == false) {
            customers.add(value);
          }
        }
      }

      setLoading(false);
    } else {
      setLoading(true);

      List<CustomerUserEntity> result =
          await _getCustomers.call(page: page, limit: limit, name: name);

      if (result.isNotEmpty) {
        for (CustomerUserEntity value in result) {
          if (customers.contains(value) == false) {
            customers.add(value);
          }
        }
      }

      setLoading(false);
    }
  }

  @action
  setFilter(String value, context) {
    name = value;

    if (debounce?.isActive ?? false) debounce?.cancel();

    debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        setLoading(true);

        page = 1;

        List<CustomerUserEntity> result =
            await _getCustomers.call(page: page, limit: limit, name: name);

        customers = result.asObservable();
      } catch (e) {
        ShowErrorMessageUsecase(context: context)
            .call(message: "Não foi possível pesquisar novos clientes.");
      } finally {
        setLoading(false);
      }
    });
  }

  @action
  init() async {
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent &&
          loading == false) {
        loadingMoreCustomers();
      }
    });

    List<CustomerUserEntity> result =
        await _getCustomers.call(page: page, limit: limit);

    customers = result.asObservable();
  }

  @override
  void dispose() {
    scroll.dispose();
  }
}
