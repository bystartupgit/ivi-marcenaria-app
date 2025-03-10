

import 'package:marcenaria/modules/admin/domain/mappers/employee_user_mapper.dart';

class EmployeeUserEntity {

  final int employeeID;
  final int userID;

  final String name;
  final String email;
  final String phone;
  final String? statusInteresse;

  final String statusContrato;
  final bool status;

  final List<String> funcoes;

  EmployeeUserEntity({required this.employeeID,
    required this.email, required this.phone,
    this.funcoes = const [],
    required this.status,
    this.statusInteresse,
    required this.statusContrato,
    required this.userID, required this.name});

  factory EmployeeUserEntity.fromMapWithInteresting(Map<String,dynamic> map, String interesting) =>
      EmployeeUserEntity(
          status: map[EmployeeUserMapper.status] ?? "aceito",
          email: map[EmployeeUserMapper.user]?[EmployeeUserMapper.email] ?? "",
          phone: map[EmployeeUserMapper.user]?[EmployeeUserMapper.phone] ?? "",
          funcoes: map[EmployeeUserMapper.funcoes] == null?
          <String>[] : List<String>.from(map[EmployeeUserMapper.funcoes]),
          employeeID: map[EmployeeUserMapper.employeeID],
          userID: map[EmployeeUserMapper.userID],
          statusInteresse: interesting,
          statusContrato: map[EmployeeUserMapper.contract],
          name: map[EmployeeUserMapper.user]?[EmployeeUserMapper.name] ?? "Nome Prestador");


  factory EmployeeUserEntity.fromMap(Map<String,dynamic> map) =>
      EmployeeUserEntity(
          status: map[EmployeeUserMapper.status] ?? "aceito",
          email: map[EmployeeUserMapper.user]?[EmployeeUserMapper.email] ?? "",
          phone: map[EmployeeUserMapper.user]?[EmployeeUserMapper.phone] ?? "",
          funcoes: map[EmployeeUserMapper.funcoes] == null?
          <String>[] : List<String>.from(map[EmployeeUserMapper.funcoes]),
          employeeID: map[EmployeeUserMapper.employeeID],
          userID: map[EmployeeUserMapper.userID],
          statusContrato: map[EmployeeUserMapper.contract],
          name: map[EmployeeUserMapper.user]?[EmployeeUserMapper.name] ?? "Nome Prestador");

  factory EmployeeUserEntity.fromOrder(Map<String,dynamic> map) =>
      EmployeeUserEntity(
          status: map[EmployeeUserMapper.status] ?? "aceito",
          email: map[EmployeeUserMapper.email] ?? "",
          phone: map[EmployeeUserMapper.phone] ?? "",
          funcoes: map[EmployeeUserMapper.funcoes] == null?
          <String>[] : List<String>.from(map[EmployeeUserMapper.funcoes]),
          employeeID: map[EmployeeUserMapper.employeeID],
          userID: map[EmployeeUserMapper.userID],
          statusContrato: map[EmployeeUserMapper.contract],
          name: map[EmployeeUserMapper.name] ?? "Nome Prestador");

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is EmployeeUserEntity) { return employeeID == other.employeeID; }
    return false;
  }

  @override
  int get hashCode => employeeID.hashCode;

}