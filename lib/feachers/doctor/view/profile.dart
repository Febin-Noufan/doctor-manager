import 'package:doctor_manager/feachers/doctor/entity/doctor.dart';
import 'package:doctor_manager/feachers/doctor/presenter/presenter.dart';
import 'package:doctor_manager/feachers/doctor/presenter/shared_pref_presenter.dart';
import 'package:doctor_manager/feachers/doctor/view/ui.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final SharedPrefPresenter sharedPrefPresenter;
  final DoctorPresenter doctorPresenter;

  const ProfilePage({
    super.key,
    required this.sharedPrefPresenter,
    required this.doctorPresenter,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Doctor? doctor;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initProfile();
  }

  Future<void> _initProfile() async {
    final savedName =
        await widget.sharedPrefPresenter.loadingValueFromSharedPref();
    final fetchedDoctor =
        widget.doctorPresenter.getDoctorByNamePresenter(savedName);

    setState(() {
      doctor = fetchedDoctor;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/profile_picture.png'),
                      ),
                      SizedBox(height: 20),
                      // Name
                      Text(
                        doctor?.name ?? 'Unknown',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[800],
                        ),
                      ),
                      SizedBox(height: 8),
                      // Email
                      Text(
                        doctor?.email ?? 'No Email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      Divider(
                          height: 40, thickness: 1, color: Colors.grey[300]),
                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle edit profile logic here
                            },
                            icon: Icon(Icons.edit, size: 18),
                            label: Text('Edit Profile'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await widget.sharedPrefPresenter
                                  .clearValueFromSharedPref();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorView(
                                    presenter: widget.doctorPresenter,
                                    sharedPrefPresenter:
                                        widget.sharedPrefPresenter,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.logout, size: 18),
                            label: Text('Logout'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.teal,
                              side: BorderSide(color: Colors.teal),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
