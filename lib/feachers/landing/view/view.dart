import 'package:doctor_manager/feachers/landing/view/card.dart';
import 'package:flutter/material.dart';
import 'package:doctor_manager/feachers/doctor/presenter/shared_pref_presenter.dart';
import 'package:doctor_manager/feachers/landing/presenter.dart';

class LandingPageRouter extends StatelessWidget {
  final SharedPrefPresenter sharedPrefPresenter;

  LandingPageRouter({super.key, required this.sharedPrefPresenter});

  final LandingPagePresenter presenter = LandingPagePresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Doctor Manager',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LandingCard(
                icon: Icons.admin_panel_settings,
                onTap: () async => presenter.navigateToAdminPage(context),
                title: 'Admin Access',
              ),
              SizedBox(height: 20),
              LandingCard(
                icon: Icons.medical_services,
                onTap: () async =>
                    presenter.checkNavigate(context, sharedPrefPresenter),
                title: 'Doctor Portal',
              )
            ],
          ),
        ),
      ),
    );
  }
}
