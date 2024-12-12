import 'package:doctor_manager/feachers/admin/entity/department.dart';
import 'package:doctor_manager/feachers/doctor/entity/doctor.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class DoctorInteractor {
  final _doctorBox = Hive.box<Doctor>('doctors');
  final _departmentBox = Hive.box<Department>('departments');
  String? selectedDepartmentId;

  List<Department> getDepartments() {
    return _departmentBox.values.toList();
  }

  void createDoctor(String name, String email) {
    final doctor = Doctor(
      id: Uuid().v4(),
      name: name,
      email: email,
      departmentId: selectedDepartmentId!,
    );
    _doctorBox.put(doctor.id, doctor);
  }

  // Function to fetch a doctor by ID
  Doctor? getDoctorById(String doctorId) {
    return _doctorBox.get(doctorId);
  }

  // Function to fetch all doctors
  List<Doctor> getAllDoctors() {
    return _doctorBox.values.toList();
  }
}
