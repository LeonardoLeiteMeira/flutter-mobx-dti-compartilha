import 'package:mobx/mobx.dart';
part 'form.error.g.dart';

class FormError = _FormErrorBase with _$FormError;

abstract class _FormErrorBase with Store {
  @observable
  String? username;

  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors => username != null || email != null || password != null;
}
