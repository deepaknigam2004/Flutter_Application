import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/user_tile.dart';
import 'add_user_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserProvider>(context).users;

    return Scaffold(
      appBar: AppBar(title: Text('Users'), backgroundColor: Colors.blue,),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 700 ? 3 : 1,
          childAspectRatio: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: users.length,
        itemBuilder: (ctx, i) => UserTile(user: users[i]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddUserScreen()));
        },
      ),
    );
  }
}
