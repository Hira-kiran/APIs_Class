import 'dart:convert';

import 'package:apispart/Model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  List<UserModel> userList = [];
  Future<List<UserModel>> userApi() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UserModel.fromJson(i));
      }
    } else {
      return userList;
    }
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserAPI"),
      ),
      body: FutureBuilder(
          future: userApi(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(userList[index].address!.city.toString()),
                      subtitle: Text(userList[index].company!.name.toString()),
                    );
                  });
            }
          })),
    );
  }
}
