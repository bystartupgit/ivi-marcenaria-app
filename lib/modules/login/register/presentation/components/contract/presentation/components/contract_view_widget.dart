import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/login/register/presentation/components/contract/presentation/components/contract_check_widget.dart';

import 'contract_button_widget.dart';
import 'contract_download_widget.dart';

class ContractViewWidget extends StatelessWidget {
  const ContractViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorTheme.gray,
                blurRadius: 4.0, offset: const Offset(0.0, 3.0))],
            color: ColorTheme.lightGray,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
            children: [
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorTheme.background),
                ),
              ),
              const SizedBox(height: 10.0),
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: ContractDownloadWidget(download: () {})),
              const SizedBox(height: 30.0),
              ContractCheckWidget(value: false, onChanged: (value){}),
              const SizedBox(height: 20.0),
              ContractButtonWidget(onPress: () => Modular.to.pushNamed(RouterMapper.successIntern))
            ]),
      ),
    );
  }
}
