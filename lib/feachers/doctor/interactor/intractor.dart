import 'package:doctor_manager/feachers/admin/entity/department.dart';
import 'package:doctor_manager/feachers/doctor/entity/doctor.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

class DoctorInteractor {
  final _doctorBox = Hive.box<Doctor>('doctors');
  final _departmentBox = Hive.box<Department>('departments');
  String? selectedDepartmentId;

  List<Department> getDepartments() {
    return _departmentBox.values.toList();
  }

  void createDoctor(String name, String email, String pass, String number) {
    final doctor = Doctor(
        id: Uuid().v4(),
        name: name,
        email: email,
        departmentId: selectedDepartmentId!,
        password: pass,
        number: number);
    _doctorBox.put(doctor.id, doctor);
  }

  /// Login function: Checks email and password
  Doctor? loginDoctor(String name, String password) {
    try {
      return _doctorBox.values.firstWhere(
        (doctor) => doctor.name == name && doctor.password == password,
        // orElse: () => null, // Return null if not found
      );
    } catch (e) {
      return null;
    }
  }

  // Function to fetch a doctor by Name
  Doctor? getDoctorByName(String docName) {
    return _doctorBox.values.firstWhere(
      (doctor) => doctor.name == docName,
    );
  }

  // Function to fetch all doctors
  List<Doctor> getAllDoctors() {
    return _doctorBox.values.toList();
  }
}
