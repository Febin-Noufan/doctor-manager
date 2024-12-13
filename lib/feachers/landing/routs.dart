import 'package:doctor_manager/feachers/admin/presenter/presenter.dart';
import 'package:doctor_manager/feachers/admin/view/ui.dart';
import 'package:doctor_manager/feachers/doctor/presenter/presenter.dart';
import 'package:doctor_manager/feachers/doctor/presenter/shared_pref_presenter.dart';
import 'package:doctor_manager/feachers/doctor/view/profile.dart';
import 'package:flutter/material.dart';

import '../doctor/view/ui.dart';

class LandingPageRouter {
  static void goToregister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorView(
          sharedPrefPresenter: SharedPrefPresenter(
              //  intracter: SharedPrefIntracter(),
              ),
          presenter: DoctorPresenter(
              //  interactor: DoctorInteractor(),
              ),
        ),
      ),
    );
  }

  static void goToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProfilePage(
                doctorPresenter: DoctorPresenter(),
                sharedPrefPresenter: SharedPrefPresenter(),
              )),
    );
  }

  static void goToAdmin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminView(
          presenter: AdminPresenter(),
        ),
      ),
    );
  }
}
