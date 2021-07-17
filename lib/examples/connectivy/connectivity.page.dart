import 'package:flutter/material.dart';

import 'connectivity.controller.dart';

class ConnectivityPage extends StatelessWidget {
  final ConnectivityController controller = ConnectivityController();

  ConnectivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldMessengerKey,
      appBar: AppBar(title: Text("Exemplo ouvindo a conexão")),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text("Handle Connectivity Status"),
          ),
        ),
      ),
    );
  }
}
