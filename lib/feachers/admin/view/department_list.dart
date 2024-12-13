// import 'package:flutter/material.dart';

// class DepartmentList extends StatelessWidget {
//   final List<dynamic> departments;
//   final Function onDeleteDepartment;

//   const DepartmentList({
//     super.key,
//     required this.departments,
//     required this.onDeleteDepartment,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: departments.isEmpty
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.folder_open, size: 80, color: Colors.grey[300]),
//                   SizedBox(height: 15),
//                   Text(
//                     'No departments added yet',
//                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             )
//           : ListView.builder(
//               itemCount: departments.length,
//               itemBuilder: (context, index) {
//                 final department = departments[index];
//                 return Card(
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 8),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   child: ListTile(
//                     title: Text(department.name, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
//                     trailing: IconButton(
//                       onPressed: () => onDeleteDepartment(department.id),
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       tooltip: 'Delete Department',
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
