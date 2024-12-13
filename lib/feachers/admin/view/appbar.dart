import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;
  const CustomAppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight, 
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
