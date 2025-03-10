import '../mappers/customer_user_mapper.dart';

class CustomerUserEntity {

  final int customerID;
  final int userID;

  final String name;
  final String email;
  final String phone;
  final String cpf;
  final String? image;

  final bool status;

  CustomerUserEntity({
    required this.customerID,
    required this.email, required this.phone,
    required this.status,
    required this.cpf,
    this.image,
    required this.userID, required this.name});

  factory CustomerUserEntity.fromMap(Map<String,dynamic> map) =>
      CustomerUserEntity(
          status: map[CustomerUserMapper.status],
          email: map[CustomerUserMapper.email] ?? "",
          phone: map[CustomerUserMapper.phone] ?? "",
          cpf: map[CustomerUserMapper.cpf] ?? "",
          userID: map[CustomerUserMapper.userID],
          image: map[CustomerUserMapper.image],
          customerID: map[CustomerUserMapper.customerID],
          name: map[CustomerUserMapper.name] ?? "Cliente");

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is CustomerUserEntity) { return customerID == other.customerID; }
    return false;
  }

  @override
  int get hashCode => customerID.hashCode;

}