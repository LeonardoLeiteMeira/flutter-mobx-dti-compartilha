import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dti_compartilha/router/router.const.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  void navigate(String page, context) {
    Navigator.pushNamed(context, page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Navegação entre os exemplos"),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => navigate(RouterConstants.FORM, context),
                    child: Text("Navigate to Form Exemple")),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () =>
                        navigate(RouterConstants.CONNECTIVY, context),
                    child: Text("Navigate to Connectivy Exemple")),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () =>
                        navigate(RouterConstants.ARCHITECTURE, context),
                    child: Text("Navigate to Architecture Exemple")),
                SizedBox(height: 15),
              ],
            ),
          ),
        ));
  }
}
