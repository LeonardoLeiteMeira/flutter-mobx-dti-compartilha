import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'form.controller.dart';

class FormPage extends StatelessWidget {
  final controller = FormController();

  FormPage({Key? key}) : super(key: key);

  InputDecoration textFieldDecoration(String label) => InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      errorText: controller.error.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Exemplo de formulario")),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Form(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Observer(
                    builder: (_) => TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username",
                          hintText: "Entre com o username",
                          errorText: controller.error.username),
                      onChanged: controller.setUsername,
                    ),
                  ),
                  SizedBox(height: 20),
                  Observer(
                    builder: (_) => TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          hintText: "Entre com o email",
                          errorText: controller.error.email),
                      onChanged: controller.setEmail,
                    ),
                  ),
                  SizedBox(height: 20),
                  Observer(
                    builder: (_) => TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          hintText: "Entre com a senha",
                          errorText: controller.error.password),
                      onChanged: controller.setPassword,
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                      onPressed: controller.validateAll, child: Text("Submit"))
                ],
              ),
            )),
          ),
        ));
  }
}
