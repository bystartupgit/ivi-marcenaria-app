import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/domain/usecases/create_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_order_without_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';
import 'package:marcenaria/modules/admin/external/proposal_datasource.dart';
import 'package:marcenaria/modules/admin/external/user_datasource.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/create_proposal_page.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/stores/create_proposal_store.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/stores/proposal_store.dart';

import 'domain/usecases/get_order_waiting_proposal_usecase.dart';
import 'navigation/navigation_page.dart';
import 'navigation/stores/navigation_store.dart';

class AdminModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(() => NavigationStore());
    i.addSingleton(() => ProposalStore());
    i.add(() => CreateProposalStore());


    i.add(() => OrderDataSource());
    i.add(()=> ProposalDataSource());
    i.add(() => UserDataSource());

    i.add(() => GetOrderWithoutProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetWaitingProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetUserUseCase(datasource: i.get<UserDataSource>()));
    i.add(() => CreateProposalUsecase(datasource: i.get<ProposalDataSource>()));
    i.add(() => GetOrderWaitingAppovalUsecase(datasource: i.get<OrderDataSource>()));
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
    r.child(RouterMapper.createProposal, child: (context) => CreateProposalPage(orderID: r.args.data));
  }
}