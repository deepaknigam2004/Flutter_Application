import 'package:flutter/material.dart';
import '../models/user.dart';
import '../screens/user_detail_screen.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => UserDetailScreen(user: user))),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(user.email),
            ],
          ),
        ),
      ),
    );
  }
}
