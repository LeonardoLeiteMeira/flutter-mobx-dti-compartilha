import 'package:mobx/mobx.dart';

import 'model/data.state.dart';
import 'model/phone.model.dart';
import 'usecase/phone.usecase.dart';
part 'architecture.controller.g.dart';

class ArchitectureController = _ArchitectureControllerBase
    with _$ArchitectureController;

abstract class _ArchitectureControllerBase with Store {
  final _phoneUsecase = PhoneUsecase();

  var phoneListState = DataState<List<PhoneModel>>();

  _ArchitectureControllerBase() {
    fetchData();
  }

  void fetchData() async {
    var resultList = await _phoneUsecase.getPhoneList();
    if (resultList.isNotEmpty) {
      phoneListState.setData(resultList);
    } else {
      phoneListState.setError("Nenhum telefone pode ser carregado");
    }
  }

  void nextPage() async {
    phoneListState.setLoading();
    var resultList = await _phoneUsecase.getPhoneListByPage();
    if (resultList.isNotEmpty) {
      phoneListState.setData(resultList);
    } else {
      phoneListState.setError("Nenhum telefone pode ser carregado");
    }
  }
}
