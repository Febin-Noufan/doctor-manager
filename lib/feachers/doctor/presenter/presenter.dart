import 'dart:developer';

import 'package:doctor_manager/feachers/doctor/entity/doctor.dart';
import 'package:doctor_manager/feachers/doctor/interactor/intractor.dart';
import 'package:doctor_manager/feachers/doctor/presenter/shared_pref_presenter.dart';
import 'package:doctor_manager/feachers/doctor/view/profile.dart';
import 'package:flutter/material.dart';

class DoctorPresenter extends DoctorInteractor {
  // final DoctorInteractor interactor;

  DoctorPresenter();

  List<Doctor> doctors = [];
  Doctor? doctor;
  String errorMessage ="";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<DropdownMenuItem<String>> getDepartmentDropdownItems() {
    return getDepartments().map((department) {
      return DropdownMenuItem<String>(
        value: department.id,
        child: Text(department.name),
      );
    }).toList();
  }

  void setSelectedDepartment(String? departmentId) {
    selectedDepartmentId = departmentId;
  }

  void registerDoctor(String name, String email, String pass, String number) {
    createDoctor(name, email, pass, number);
  }

  Doctor? getDoctorByNamePresenter(String docName) {
    log("Fetching doctor with name: $docName");
    return getDoctorByName(docName);
  }

  Doctor? loginDoctorPresenter(String name,String pass){
    return loginDoctor(name, pass);
  }

  getAllDoctorsfor() {
    doctors = getAllDoctors();
  }


  void handleLogin(String name,String password,SharedPrefPresenter shared_pref,BuildContext context) {
 
    final doctor = loginDoctorPresenter(name, password);
    // widget.p.loginDoctor(name, password);

    if (doctor != null) {
      // Save login status in shared preferences
   shared_pref.saveValueFromSharedPref(name);

      // Navigate to Profile Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            sharedPrefPresenter: shared_pref,
            doctorPresenter: DoctorPresenter(), 
          ),
        ),
      );
    } else {
      // Display error message
  
        errorMessage = 'Invalid email or password';
    
    }
  }
}
