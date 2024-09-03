import 'package:flutter/material.dart';
import 'package:users/src/models/user.dart';
import 'package:users/src/services/api.dart';

class AddUserPage extends StatelessWidget {
  AddUserPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController avatarController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(controller: idController),
              TextFormField(controller: nameController),
              TextFormField(controller: avatarController),
              ElevatedButton(onPressed: () async {
                final user =User(createdAt: DateTime.now(), name: nameController.text, avatar: avatarController.text, id: idController.text);
                final data = await postUser(user);
                ScaffoldMessenger(child: Text(data));
              }, child: const Text('Submit User')),
            ],
          ),
        ),
      ),
    );
  }
}
