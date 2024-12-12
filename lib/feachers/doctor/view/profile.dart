import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 600), // Limit width for web design
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with your image asset
                ),
                SizedBox(height: 20),
                // Name
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800],
                  ),
                ),
                SizedBox(height: 8),
                // Email
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                Divider(height: 40, thickness: 1, color: Colors.grey[300]),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle edit profile
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
                      onPressed: () {
                        // Handle logout
                      },
                      icon: Icon(Icons.logout, size: 18),
                      label: Text('Logout'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.teal, side: BorderSide(color: Colors.teal),
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
