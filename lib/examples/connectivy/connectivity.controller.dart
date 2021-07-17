import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'connectivity.controller.g.dart';

class ConnectivityController = _ConnectivityControllerBase
    with _$ConnectivityController;

abstract class _ConnectivityControllerBase with Store {
  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  late List<ReactionDisposer> _disposers;
  _ConnectivityControllerBase() {
    _disposers = [
      reaction(
          (_) => connectivityStream.value,
          (result) => scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
              content: Text(result == ConnectivityResult.none
                  ? 'You\'re offline'
                  : 'You\'re online'))),
          delay: 1000)
    ];
  }

  void dispose() {
    _disposers.map((dipose) => dipose());
  }
}
