import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.company,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String company;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json['id'] ?? "",
        firstName: json['firstName'] ?? "",
        lastName: json['lastName'] ?? "",
        email: json['email'] ?? "",
        company: json['company'] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'company': company,
      };
  factory UserEntity.empty() => const UserEntity(
        id: "",
        firstName: "",
        lastName: "",
        email: "",
        company: "",
      );
  @override
  List<Object?> get props => [id, firstName, lastName, email, company];
}
