import 'package:equatable/equatable.dart';

class Language extends Equatable {
  const Language({
    required this.code,
    required this.name,
  });

  final String code;
  final String name;

  factory Language.fromJson(dynamic json) {
    return Language(code: json[''].toString(), name: json[''].toString());
  }

  @override
  List<Object?> get props => [code];
}
