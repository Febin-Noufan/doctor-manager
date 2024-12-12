import 'package:doctor_manager/feachers/admin/entity/department.dart';
import 'package:doctor_manager/feachers/admin/view/landing.dart';
import 'package:doctor_manager/feachers/doctor/entity/doctor.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DepartmentAdapter());
  Hive.registerAdapter(DoctorAdapter());
  Hive.openBox<Doctor>("doctors");
  Hive.openBox<Department>("departments");

  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Registration',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LandingPageRouter(),
    );
  }
}
