import 'package:hive/hive.dart';

part 'doctor.g.dart';

@HiveType(typeId: 2)
class Doctor {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String departmentId;

  @HiveField(4)
  final String password;

  @HiveField(5)
  final String number;

  Doctor({
    required this.password,
    required this.number,
    required this.id,
    required this.name,
    required this.email,
    required this.departmentId,
  });
}
