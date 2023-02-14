// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signup(String email, String password) async {
    try {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});


      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("Signup successfuuly");
      } else {
        print("Failed");
      }
    } catch (e) {
      print("Exception $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "Email"),
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          ElevatedButton(
              onPressed: () {
                signup(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: const Text("Signup"))
        ],
      ),
    );
  }
}
