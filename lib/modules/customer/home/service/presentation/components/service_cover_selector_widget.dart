import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/service/domain/mappers/service_cover_mapper.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_cover_button_widget.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_cover_file_item_widget.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_cover_item_widget.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../domain/enum/cover_type.dart';

class ServiceCoverSelectorWidget extends StatelessWidget {
  final String title =
      "Deseja facilitar ainda mais a encontrar seu projeto em nosso app? ";
  final String subtitle = "(este passo é opcional)";

  final String description = "Você pode selecionar uma capa para seu projeto, "
      "facilitando sua localização em nosso aplicativo.";

  final ServiceStore store;

  const ServiceCoverSelectorWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Card(
          elevation: 3,
          color: ColorTheme.lightGray,
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: title,
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorTheme.title,
                              fontFamily: FamilyTheme.bold)),
                      TextSpan(
                          text: subtitle,
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorTheme.title,
                              fontFamily: FamilyTheme.regular)),
                    ])),
                    const SizedBox(height: 5.0),
                    Text(description,
                        style: TextStyle(
                            fontSize: 12,
                            color: ColorTheme.title,
                            fontFamily: FamilyTheme.regular)),
                    const SizedBox(height: 5.0),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(spacing: 5.0, children: [
                          Row(
                              spacing: 5.0,
                              mainAxisSize: MainAxisSize.min,
                              children: ServiceCoverMapper.covers
                                  .map((e) => ServiceCoverItemWidget(
                                      image: e,
                                      selected: store.cover.$1 == e,
                                      onPressed: () =>
                                          store.setCover((e, CoverType.asset))))
                                  .toList()),
                          Row(
                              spacing: 5.0,
                              mainAxisSize: MainAxisSize.min,
                              children: store.coverFiles
                                  .map((e) => ServiceCoverFileItemWidget(
                                      image: e,
                                      selected: store.cover.$1 == e.path,
                                      onPressed: () => store
                                          .setCover((e.path, CoverType.file))))
                                  .toList()),
                          ServiceCoverButtonWidget(
                              onPressed: () =>
                                  store.addCoverFile(context: context))
                        ]))
                  ])));
    });
  }
}
