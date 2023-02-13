// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductApiScreen extends StatefulWidget {
  const ProductApiScreen({super.key});

  @override
  State<ProductApiScreen> createState() => _ProductApiScreenState();
}

class _ProductApiScreenState extends State<ProductApiScreen> {
  Future<productApiModel> productFun() async {
    var response = await http
        .get(Uri.parse("https://thewebconcept.com/hotel2/api/pro_api.php"));

    var data = jsonDecode(response.body.toString());
    print(data);

    if (response.statusCode == 200) {
      return productApiModel.fromJson(data);
    }
    return productApiModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Api"),
      ),
      body: FutureBuilder(
          future: productFun(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Text(
                            snapshot.data!.data![index].productName.toString()),
                        Text(snapshot.data!.data![index].rate.toString()),
                        Text(snapshot.data!.data![index].categoriesName
                            .toString()),
                      ],
                    );
                  }));
            }
          }),
    );
  }
}
