import 'package:doctor_manager/feachers/doctor/presenter/presenter.dart';
import 'package:flutter/material.dart';

class DoctorView extends StatefulWidget {
  final DoctorPresenter presenter;

  DoctorView({required this.presenter});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.presenter.getAllDoctors();
    return Scaffold(
      appBar: AppBar(title: Text('Doctor - Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            DropdownButtonFormField<String>(
              items: widget.presenter.getDepartmentDropdownItems(),
              onChanged: widget.presenter.setSelectedDepartment,
              decoration: InputDecoration(labelText: 'Select Department'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.presenter.registerDoctor(
                  nameController.text,
                  emailController.text,
                );
                });
              },
              child: Text('Register'),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: widget.presenter.doctors.length,
              itemBuilder: (context, index) {
                final doctor=widget.presenter.doctors[index];
                return ListTile(
                  title: Text(doctor.name),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
