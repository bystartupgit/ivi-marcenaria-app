import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_calculator_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_customer_button_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_details_card_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proporsal_card_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/stores/create_proposal_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/data/router_global_mapper.dart';
import '../../../../../core/themes/color_theme.dart';
import 'components/check_button_widget.dart';

class CreateProposalPage extends StatefulWidget {

  final int orderID;

  const CreateProposalPage({super.key, required this.orderID});

  @override
  State<CreateProposalPage> createState() => _CreateProposalPageState();
}

class _CreateProposalPageState extends State<CreateProposalPage> {

  final CreateProposalStore store = Modular.get<CreateProposalStore>();

  @override
  void initState() {
    store.init(orderID: widget.orderID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ModalProgressHUD(
        inAsyncCall: store.loading,

        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorTheme.background,
            appBar: AppBar(
                backgroundColor: ColorTheme.background,
                leading: IconButton(onPressed: () => Modular.to.pop(),
                    icon: Icon(Icons.arrow_back_ios_new_rounded,color: ColorTheme.black2))
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      CreateProporseDetailsCardWidget(order: store.order!, moreDetails: store.showMore,
                          changeMoreDetails: store.setShowMore),
                      const SizedBox(height: 20.0),
                      CreateProporseCalculatorWidget(store: store),
                      const SizedBox(height: 20.0),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 10,
                          children: [
                            Expanded(
                              child: CreateProporseCustomerButtonWidget(size: 12,onPressed: () =>
                                  Modular.to.pushNamed(RouterGlobalMapper.chatSupport, arguments: store.order)
                              ),
                            ),
                            Expanded(child: CheckButtonWidget(size: 12,
                                onPressed: () => showModalBottomSheet(context: context,
                                    backgroundColor: ColorTheme.background,
                                    builder: (context) => ProporsalCardReviewWidget(dto: store.dto(), store: store, proposal: store.proporsalFile))))
                          ]),
                      const SizedBox(height: 40.0),
                    ]),
              ),
            )),
      ),
    );
  }
}
