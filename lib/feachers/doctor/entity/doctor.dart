import 'package:hive/hive.dart';

part 'doctor.g.dart';

@HiveType(typeId: 1)
class Doctor {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String departmentId;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.departmentId,
  });
}
