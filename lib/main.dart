import 'package:flutter/material.dart';

class MyModel {
  String name;
  String email;

  MyModel({required this.name, required this.email});
}

class MyController {
  MyModel model;

  MyController(this.model);

  void updateName(String newName) {
    model.name = newName;
  }

  void updateEmail(String newEmail) {
    model.email = newEmail;
  }
}

class MyView extends StatelessWidget {
  final MyController controller;

  MyView(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model View Controller'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => controller.updateName(value),
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            onChanged: (value) => controller.updateEmail(value),
            decoration: InputDecoration(labelText: 'Email'),
          ),
          Text('Name: ${controller.model.name}'),
          Text('Email: ${controller.model.email}'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyView(MyController(MyModel(name: 'John Doe', email: 'john.doe@example.com'))),
  ));
}
