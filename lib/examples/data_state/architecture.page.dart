import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_dti_compartilha/examples/data_state/architecture.controller.dart';
import 'package:flutter_mobx_dti_compartilha/router/router.const.dart';

import 'model/phone.model.dart';

class ArchitecturePage extends StatefulWidget {
  const ArchitecturePage({Key? key}) : super(key: key);

  @override
  _ArchitecturePageState createState() => _ArchitecturePageState();
}

class _ArchitecturePageState extends State<ArchitecturePage> {
  final controller = ArchitectureController();

  @override
  initState() {
    controller.phoneListState.handleReactionState(success: (data) {
      Navigator.of(context).pushNamed(RouterConstants.INITIAL);
    });
    super.initState();
  }

  _ArchitecturePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo com data state"),
        actions: [
          IconButton(onPressed: controller.nextPage, icon: Icon(Icons.plus_one))
        ],
      ),
      body: Container(
        child: Observer(
          //   builder: (_) => controller.phoneListState.handleState(
          //       () => Center(
          //             child: CircularProgressIndicator(),
          //           ),
          //       (data) => ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: data?.length,
          //             itemBuilder: (_, index) => phoneCard(data?[index]),
          //           ),
          //       (errorMessage) => Center(
          //             child: Text("Ocorreu o seguite erro: $errorMessage"),
          //           )),
          // ),
          builder: (_) => controller.phoneListState.handleStateReloadable(
              () => Center(
                    child: CircularProgressIndicator(),
                  ), (data, loading) {
            return Column(children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: data?.length,
                itemBuilder: (_, index) => phoneCard(data?[index]),
              ),
              loading ? CircularProgressIndicator() : SizedBox()
            ]);
          },
              (errorMessage) => Center(
                    child: Text("Ocorreu o seguite erro: $errorMessage"),
                  )),
        ),
      ),
    );
  }

  Widget phoneCard(PhoneModel? phoneModel) => Card(
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nome do modelo: ${phoneModel?.name}"),
              Text("Memoria: ${phoneModel?.memory.toString()}"),
              Text("Lançado em: ${phoneModel?.year.toString()}"),
            ],
          ),
        ),
      );
}
