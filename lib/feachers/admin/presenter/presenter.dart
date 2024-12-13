import 'package:doctor_manager/feachers/admin/entity/department.dart';
import 'package:doctor_manager/feachers/admin/interactor/intracter.dart';

class AdminPresenter extends AdminInteractor {
  AdminPresenter();

  List<Department> deparment = [];

  void addDepartment(String name) {
    createDepartment(name);
  }

 
  void deleteDepartmentfor(String id) {
    deleteDepartment(id);
  }

  void getDepartmentfor() {
    deparment = getDepartments();
  }
}
