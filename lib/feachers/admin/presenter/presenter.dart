import 'package:doctor_manager/feachers/admin/entity/department.dart';
import 'package:doctor_manager/feachers/admin/interactor/intracter.dart';

class AdminPresenter {
  final AdminInteractor interactor;

  AdminPresenter({required this.interactor});

  List<Department> deparment = [];

  void addDepartment(String name) {
    interactor.createDepartment(name);
  }

  void deleteDepartment(String id) {
    interactor.deleteDepartment(id);
  }

  void getDepartment() {
    deparment = interactor.getDepartments();
   // print("{{{{{{{{{{{{{{{{{{{${deparment}}}}}}}}}}}}}}}}}}}}");
  }
}
