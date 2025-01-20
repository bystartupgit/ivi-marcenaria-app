import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_job_pills_widget.dart';
import 'package:marcenaria/modules/login/domain/mappers/job_mapper.dart';

class ProfilePositionWidget extends StatelessWidget {

  final List<String> jobs;
  final String title = "Serviços á oferecer";

  const ProfilePositionWidget({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            decoration: BoxDecoration(
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(color: ColorTheme.black,fontFamily: FamilyTheme.regular,fontSize: 11)),
                  const SizedBox(height: 15.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileJobPillWidget(
                            job: JobMapper.marceneiro,
                            selected: jobs.contains(JobMapper.marceneiro)),
                        const SizedBox(width: 10.0),
                        ProfileJobPillWidget(
                            job: JobMapper.montador,
                            selected: jobs.contains(JobMapper.montador)),
                        const SizedBox(width: 10.0),
                        ProfileJobPillWidget(
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
                            selected: jobs.contains(JobMapper.vendedor)),
                        const SizedBox(width: 10.0),
                        ProfileJobPillWidget(
                            job: JobMapper.projetista,
                            selected: jobs.contains(JobMapper.projetista)),
                      ]),
                ]));
  }
}
