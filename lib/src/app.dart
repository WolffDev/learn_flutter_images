import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:learn_simple_images/src/models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var parsedJson = json.decode(response.body);
    var imageModal = ImageModel.fromJson(parsedJson);
    setState(() {
      images.add(imageModal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber[900],
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('Hot reload works!! 123')),
        body: ImageList(images),
      ),
    );
  }
}
