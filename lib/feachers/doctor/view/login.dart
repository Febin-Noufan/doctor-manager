import 'package:doctor_manager/feachers/doctor/presenter/presenter.dart';
import 'package:flutter/material.dart';
import 'package:doctor_manager/feachers/doctor/presenter/shared_pref_presenter.dart';


class LoginPage extends StatefulWidget {
  //final DoctorInteractor doctorInteractor;
  final SharedPrefPresenter sharedPrefPresenter;

  const LoginPage({
    super.key,
    // required this.doctorInteractor,
    required this.sharedPrefPresenter,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final DoctorPresenter doctorPresenter = DoctorPresenter();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Login'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Input
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Password Input
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            // Login Button
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final password = passwordController.text.trim();
                doctorPresenter.handleLogin(
                    name, password, SharedPrefPresenter(), context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            // Error Message
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
