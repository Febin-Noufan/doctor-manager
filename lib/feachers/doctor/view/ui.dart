import 'package:doctor_manager/feachers/doctor/presenter/presenter.dart';
import 'package:doctor_manager/feachers/doctor/presenter/shared_pref_presenter.dart';
import 'package:doctor_manager/feachers/doctor/view/login.dart';
import 'package:doctor_manager/feachers/doctor/view/profile.dart';
import 'package:flutter/material.dart';

class DoctorView extends StatefulWidget {
  final DoctorPresenter presenter;
  final SharedPrefPresenter sharedPrefPresenter;

  const DoctorView(
      {super.key, required this.presenter, required this.sharedPrefPresenter});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  @override
  Widget build(BuildContext context) {
    widget.presenter.getAllDoctorsfor();
    return Scaffold(
      appBar: AppBar(title: Text('Doctor - Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: widget.presenter.nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: widget.presenter.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: widget.presenter.numberController,
              decoration: InputDecoration(labelText: 'Number'),
            ),
            TextField(
              controller: widget.presenter.passController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            DropdownButtonFormField<String>(
              items: widget.presenter.getDepartmentDropdownItems(),
              onChanged: widget.presenter.setSelectedDepartment,
              decoration: InputDecoration(labelText: 'Select Department'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                widget.presenter.registerDoctor(
                  widget.presenter.nameController.text,
                  widget.presenter.emailController.text,
                  widget.presenter.passController.text,
                  widget.presenter.numberController.text,
                );
                await widget.sharedPrefPresenter.saveValueFromSharedPref(
                    widget.presenter.nameController.text);

                widget.presenter.nameController.clear();
                widget.presenter.emailController.clear();
                widget.presenter.passController.clear();
                widget.presenter.numberController.clear();

                Navigator.pushReplacement(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      doctorPresenter: DoctorPresenter(),
                      sharedPrefPresenter: SharedPrefPresenter(),
                    ),
                  ),
                );
              },
              child: Text('Register'),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login page"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              sharedPrefPresenter: SharedPrefPresenter(),
                            ),
                          ));
                    },
                    child: Text(
                      "click",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
