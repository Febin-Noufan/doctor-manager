import 'package:hive/hive.dart';

part 'department.g.dart';

@HiveType(typeId: 0)
class Department {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  Department({required this.id, required this.name});
}
