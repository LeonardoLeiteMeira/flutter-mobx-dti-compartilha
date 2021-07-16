import 'package:flutter_mobx_dti_compartilha/examples/form/model/form.error.dart';
import 'package:mobx/mobx.dart';
part 'form.controller.g.dart';

class FormController = _FormControllerBase with _$FormController;

abstract class _FormControllerBase with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setUsername(String value) {
    name = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  final FormError error = FormError();

  @action
  void validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      error.username = 'Cannot be blank';
      return;
    }

    error.username = null;
  }

  @action
  void validatePassword(String? value) {
    error.password = value == null || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String? value) {
    error.email = value == null ? null : 'Not a valid email';
  }
}
