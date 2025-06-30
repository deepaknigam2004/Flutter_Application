import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        _users = data.map((json) => User.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      rethrow;
    }
  }

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }
}
