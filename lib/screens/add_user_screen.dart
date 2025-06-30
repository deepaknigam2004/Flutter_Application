import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _email = '', _phone = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newUser = User(id: DateTime.now().millisecondsSinceEpoch, name: _name, email: _email, phone: _phone);
      Provider.of<UserProvider>(context, listen: false).addUser(newUser);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New User'),backgroundColor: Colors.blue,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onSaved: (val) => _name = val!,
              validator: (val) => val!.isEmpty ? 'Enter name' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (val) => _email = val!,
              validator: (val) => val!.isEmpty ? 'Enter email' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone'),
              onSaved: (val) => _phone = val!,
              validator: (val) => val!.isEmpty ? 'Enter phone' : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(child: Text('Add User'), onPressed: _submit)
          ]),
        ),
      ),
    );
  }
}
