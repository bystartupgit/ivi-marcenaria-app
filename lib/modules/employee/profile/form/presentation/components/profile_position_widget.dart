import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/profile_form_store.dart';
import 'profile_job_pill_widget.dart';
import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../../../../login/domain/mappers/job_mapper.dart';

class ProfilePositionWidget extends StatelessWidget {
  final ProfileFormStore store;
  final List<String> jobs;
  final String title = "Serviços á oferecer";

  const ProfilePositionWidget(
      {super.key, required this.jobs, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Card(
              elevation: 3,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xFFECECEC),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: TextStyle(
                                color: ColorTheme.black,
                                fontFamily: FamilyTheme.regular,
                                fontSize: 11)),
                        const SizedBox(height: 15.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProfileJobPillWidget(
                                  add: () => store.addJob(JobMapper.marceneiro),
                                  remove: () =>
                                      store.removeJob(JobMapper.marceneiro),
                                  job: JobMapper.marceneiro,
                                  selected:
                                      jobs.contains(JobMapper.marceneiro)),
                              const SizedBox(width: 10.0),
                              ProfileJobPillWidget(
                                  add: () => store.addJob(JobMapper.montador),
                                  remove: () =>
                                      store.removeJob(JobMapper.montador),
                                  job: JobMapper.montador,
                                  selected: jobs.contains(JobMapper.montador)),
                              const SizedBox(width: 10.0),
                              ProfileJobPillWidget(
                                  add: () => store.addJob(JobMapper.oficial),
                                  remove: () =>
                                      store.removeJob(JobMapper.oficial),
                                  job: JobMapper.oficial,
                                  selected: jobs.contains(JobMapper.oficial))
                            ]),
                        const SizedBox(height: 15.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProfileJobPillWidget(
                                  job: JobMapper.vendedor,
                                  add: () => store.addJob(JobMapper.vendedor),
                                  remove: () =>
                                      store.removeJob(JobMapper.vendedor),
                                  selected: jobs.contains(JobMapper.vendedor)),
                              const SizedBox(width: 10.0),
                              ProfileJobPillWidget(
                                  add: () => store.addJob(JobMapper.projetista),
                                  remove: () =>
                                      store.removeJob(JobMapper.projetista),
                                  job: JobMapper.projetista,
                                  selected:
                                      jobs.contains(JobMapper.projetista)),
                            ]),
                      ])),
            ));
  }
}
