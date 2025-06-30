import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name), backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email: ${user.email}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Phone: ${user.phone}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
