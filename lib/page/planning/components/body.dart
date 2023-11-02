import 'package:flutter/material.dart';

import '../../../storage/sqlLite.dart';

class BodyPl extends StatefulWidget {
  const BodyPl({Key? key}) : super(key: key);
  @override
  State<BodyPl> createState() => _BodyPlState();
}

class _BodyPlState extends State<BodyPl> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DatabaseHelper.instance.getUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final users = snapshot.data!;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user[DatabaseHelper.instance.columnName]),
              subtitle: Text(user[DatabaseHelper.instance.columnEmail]),
            );
          },
        );
      },
    );
  }
}
