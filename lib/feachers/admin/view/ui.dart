import 'package:doctor_manager/feachers/admin/presenter/presenter.dart';
import 'package:flutter/material.dart';

class AdminView extends StatefulWidget {
  final AdminPresenter presenter;

  AdminView({required this.presenter});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  final TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.presenter.getDepartment();
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin - Manage Departments'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Department',
              // style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 12),
            TextField(
              controller: departmentController,
              decoration: InputDecoration(
                labelText: 'Department Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.business_center),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                if (departmentController.text.trim().isNotEmpty) {
                  setState(() {
                    widget.presenter.addDepartment(departmentController.text);
                    departmentController.clear();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Department added successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a department name.')),
                  );
                }
              },
              child: Text('Add Department'),
            ),
            SizedBox(height: 24),
            Text(
              'Departments',
              //  style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 12),
            Expanded(
              child: widget.presenter.deparment.isEmpty
                  ? Center(
                      child: Text(
                        'No departments added yet.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.presenter.deparment.length,
                      itemBuilder: (context, index) {
                        final department = widget.presenter.deparment[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          elevation: 2,
                          child: ListTile(
                            title: Text(department.name),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.presenter
                                      .deleteDepartment(department.id);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Department deleted successfully!',
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
