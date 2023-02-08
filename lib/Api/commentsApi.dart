import 'dart:convert';

import 'package:apispart/Model/commentModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentApi extends StatefulWidget {
  const CommentApi({super.key});

  @override
  State<CommentApi> createState() => _CommentApiState();
}

class _CommentApiState extends State<CommentApi> {
  List<CommentApiModel> commentList = [];

  Future<List<CommentApiModel>> commentApi() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    var data = jsonDecode(response.body.toString());
    print(response.body);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        commentList.add(CommentApiModel.fromJson(i));
      }
    } else {
      return commentList;
    }

    return commentList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Api"),
      ),
      body: FutureBuilder(
          future: commentApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: const CircularProgressIndicator());
            }

            return ListView.builder(
                itemCount: commentList.length,
                itemBuilder: ((context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(commentList[index].id.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(commentList[index].postId.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(child: Text(commentList[index].email.toString())),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(commentList[index].name.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(commentList[index].body.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }));
          }),
    );
  }
}
