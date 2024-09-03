import 'package:flutter/material.dart';
import 'package:users/src/pages/adduser.dart';
import 'package:users/src/services/api.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            return ListView.builder(itemBuilder: (context, index) {
              ListTile(
                leading: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(snapshot.data![index].avatar),
                  ),
                ),
                title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].createdAt.toString()),
                trailing: Text(snapshot.data![index].id),
              );
              return null;
            });
          }),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddUserPage()));
          },child: const Icon(Icons.person_add),)
    );
  }
}
