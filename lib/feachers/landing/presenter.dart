import 'package:doctor_manager/feachers/doctor/presenter/shared_pref_presenter.dart';
import 'package:doctor_manager/feachers/landing/routs.dart';
import 'package:flutter/material.dart';

class LandingPagePresenter {
  void checkNavigate(
      BuildContext context, SharedPrefPresenter shared_pref_presenter) async {
    final value = await shared_pref_presenter.loadingValueFromSharedPref();

    if (value == null || value == "") {
      // ignore: use_build_context_synchronously
      LandingPageRouter.goToregister(context);
    } else {
      // ignore: use_build_context_synchronously
      LandingPageRouter.goToProfile(context);
    }
  }

  void navigateToAdminPage(BuildContext context) {
    LandingPageRouter.goToAdmin(context);
  }
}
