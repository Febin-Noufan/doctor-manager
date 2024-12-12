import 'package:doctor_manager/feachers/admin/entity/department.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class AdminInteractor {
  final _departmentBox = Hive.box<Department>('departments');

  void createDepartment(String name) {
    final department = Department(id: Uuid().v4(), name: name);
    _departmentBox.put(department.id, department);
//  print("::::::::::::::${department.name}");
  }


  void deleteDepartment(String id) {
    if (_departmentBox.containsKey(id)) {
      _departmentBox.delete(id);
   //   print("Department with ID $id has been deleted.");
    } else {
     // print("No department found with ID $id.");
    }
  }


  List<Department> getDepartments() {
    final departments = _departmentBox.values.toList();
    //print(departments.map((e) => e.runtimeType).toList()); // Check the types
    return departments.cast<Department>(); // Ensure explicit casting
  }
}
