import 'package:doctor_manager/feachers/admin/interactor/intracter.dart';
import 'package:doctor_manager/feachers/admin/presenter/presenter.dart';
import 'package:doctor_manager/feachers/admin/view/ui.dart';
import 'package:doctor_manager/feachers/doctor/interactor/intractor.dart';
import 'package:doctor_manager/feachers/doctor/presenter/presenter.dart';
import 'package:doctor_manager/feachers/doctor/view/ui.dart';
import 'package:flutter/material.dart';


class LandingPageRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Registration')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminView(
                      presenter: AdminPresenter(
                        interactor: AdminInteractor(),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Go to Admin Side'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorView(
                      presenter: DoctorPresenter(
                        interactor: DoctorInteractor(),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Go to Doctor Side'),
            ),
          ],
        ),
      ),
    );
  }
}
