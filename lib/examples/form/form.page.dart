import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  InputDecoration textFieldDecoration(String label) => InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(decoration: textFieldDecoration("Username")),
              SizedBox(height: 20),
              TextField(decoration: textFieldDecoration("Email")),
              SizedBox(height: 20),
              TextField(decoration: textFieldDecoration('Password')),
              SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: Text("Submit"))
            ],
          ),
        ),
      ),
    ));
  }
}
