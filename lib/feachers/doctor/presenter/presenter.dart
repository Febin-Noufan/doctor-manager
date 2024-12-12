import 'package:doctor_manager/feachers/doctor/entity/doctor.dart';
import 'package:doctor_manager/feachers/doctor/interactor/intractor.dart';
import 'package:flutter/material.dart';

class DoctorPresenter {
  final DoctorInteractor interactor;

  DoctorPresenter({required this.interactor});

  List<Doctor> doctors = [];
  List<DropdownMenuItem<String>> getDepartmentDropdownItems() {
    return interactor.getDepartments().map((department) {
      return DropdownMenuItem<String>(
        value: department.id,
        child: Text(department.name),
      );
    }).toList();
  }

  void setSelectedDepartment(String? departmentId) {
    interactor.selectedDepartmentId = departmentId;
  }

  void registerDoctor(String name, String email) {
    interactor.createDoctor(name, email);
  }

  getAllDoctors() {
    doctors= interactor.getAllDoctors();
  }
}
