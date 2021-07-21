import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx_dti_compartilha/examples/connectivy/connectivity.page.dart';
import 'package:flutter_mobx_dti_compartilha/examples/data_state/architecture.page.dart';
import 'package:flutter_mobx_dti_compartilha/examples/form/form.page.dart';
import 'package:flutter_mobx_dti_compartilha/initial/initial.page.dart';
import 'package:flutter_mobx_dti_compartilha/router/router.const.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouterConstants.INITIAL:
      return customNavigate(
          InitialPage(), settings.name ?? RouterConstants.INITIAL);

    case RouterConstants.FORM:
      return customNavigate(FormPage(), settings.name ?? RouterConstants.FORM);

    case RouterConstants.CONNECTIVY:
      return customNavigate(
          ConnectivityPage(), settings.name ?? RouterConstants.CONNECTIVY);

    case RouterConstants.ARCHITECTURE:
      return customNavigate(
          ArchitecturePage(), settings.name ?? RouterConstants.ARCHITECTURE);

    default:
      return customNavigate(
          InitialPage(), settings.name ?? RouterConstants.INITIAL);
  }
}

dynamic customNavigate(Widget page, String name) {
  return CupertinoPageRoute(
      builder: (context) => page, settings: RouteSettings(name: name));
}
