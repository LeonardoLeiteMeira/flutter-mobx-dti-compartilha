import 'package:flutter/material.dart';
import 'package:flutter_mobx_dti_compartilha/router/router.const.dart';
import 'package:flutter_mobx_dti_compartilha/router/router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mobx - DTI Compartilha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: RouterConstants.INITIAL,
    );
  }
}
