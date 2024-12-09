import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/login/domain/mappers/job_mapper.dart';
import 'package:marcenaria/modules/login/register/presentation/stores/register_store.dart';

import 'job_pill_widget.dart';

class RegisterCardOperationWidget extends StatelessWidget {

  final RegisterStore store;
  final String title = "Quais serviços você pode oferecer?";
  final String description = "Selecione um ou mais serviços que você oferecerá em nossa plataforma.";

  const RegisterCardOperationWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(color: ColorTheme.black,fontFamily: FamilyTheme.bold,fontSize: MediaQuery.of(context).size.width * 0.045)),
                  Text(description,style: TextStyle(color: ColorTheme.black,fontFamily: FamilyTheme.regular,fontSize: 12)),
                  const SizedBox(height: 15.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        JobPillWidget(
                            job: JobMapper.marceneiro, add: () => store.addJob(JobMapper.marceneiro),
                            remove: () => store.removeJob(JobMapper.marceneiro),
                            selected: store.jobs.contains(JobMapper.marceneiro)),
                        const SizedBox(width: 10.0),
                        JobPillWidget(
                            job: JobMapper.montador,
                            add: () => store.addJob(JobMapper.montador),
                            remove: () => store.removeJob(JobMapper.montador),
                            selected: store.jobs.contains(JobMapper.montador)),
                        const SizedBox(width: 10.0),
                        JobPillWidget(
                            job: JobMapper.oficial, add: () => store.addJob(JobMapper.oficial),
                            remove: () => store.removeJob(JobMapper.oficial),
                            selected: store.jobs.contains(JobMapper.oficial))
                  ]),
                  const SizedBox(height: 15.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        JobPillWidget(
                            job: JobMapper.vendedor, add: () => store.addJob(JobMapper.vendedor),
                            remove: () => store.removeJob(JobMapper.vendedor),
                            selected: store.jobs.contains(JobMapper.vendedor)),
                        const SizedBox(width: 10.0),
                        JobPillWidget(
                            job: JobMapper.projetista,
                            add: () => store.addJob(JobMapper.projetista),
                            remove: () => store.removeJob(JobMapper.projetista),
                            selected: store.jobs.contains(JobMapper.projetista)),
                      ]),
                ]))
    );
  }
}
