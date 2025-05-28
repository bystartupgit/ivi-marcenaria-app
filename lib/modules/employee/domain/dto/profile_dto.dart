import '../../../customer/home/profile/domain/mappers/profile_mappers.dart';

class ProfileDTO {
  final String name;
  final String email;
  final String cpf;
  final String phone;
  final String? image;

  final List<String> jobs;

  ProfileDTO(
      {required this.name,
      this.jobs = const [],
      this.image,
      required this.email,
      this.cpf = "",
      this.phone = ""});

  toMap() => {
        ProfileMappers.name: name,
        ProfileMappers.email: email,
        ProfileMappers.cpf:
            cpf.isEmpty ? "" : cpf.replaceAll(".", "").replaceAll("-", ""),
        ProfileMappers.phone: phone,
        ProfileMappers.jobs: jobs
      };
}
