import 'package:doctor_manager/feachers/admin/view/appbar.dart';
import 'package:flutter/material.dart';
import 'package:doctor_manager/feachers/admin/presenter/presenter.dart';

class AdminView extends StatefulWidget {
  final AdminPresenter presenter;

  const AdminView({super.key, required this.presenter});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  final TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.presenter.getDepartmentfor();
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: Column(
        children: [
          CustomAppBarWidget(
            title: 'Admin-Manage Department',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Department Addition Section
                      Text(
                        'Add New Department',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: departmentController,
                        decoration: InputDecoration(
                          labelText: 'Department Name',
                          prefixIcon:
                              Icon(Icons.business_center, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (departmentController.text.trim().isNotEmpty) {
                            setState(() {
                              widget.presenter
                                  .addDepartment(departmentController.text);
                              departmentController.clear();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Department added successfully!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Please enter a department name.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        icon: Icon(Icons.add, color: Colors.white),
                        label: Text(
                          'Add Department',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      // Department List Section
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Departments',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: widget.presenter.deparment.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.folder_open,
                                      size: 80,
                                      color: Colors.grey[300],
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'No departments added yet',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: widget.presenter.deparment.length,
                                itemBuilder: (context, index) {
                                  final department =
                                      widget.presenter.deparment[index];
                                  return Card(
                                    elevation: 4,
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        department.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            widget.presenter
                                                .deleteDepartmentfor(
                                                    department.id);
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Department deleted successfully!'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                        tooltip: 'Delete Department',
                                      ),
                                    ),
                                  );
                                },
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
