import 'package:flutter_mobx_dti_compartilha/examples/data_state/model/phone.model.dart';

class PhoneUsecase {
  late List<PhoneModel> _phoneList;

  PhoneUsecase() {
    _phoneList = [
      PhoneModel(128, "Samsung Galaxy Note 21", 2020),
      PhoneModel(128, "Samsung Galaxy S10", 2019),
      PhoneModel(64, "iPhone SE 2", 2020),
      PhoneModel(256, "iPhone 12", 2020),
      PhoneModel(128, "iPhone 11", 2019),
    ];
  }
  Future<List<PhoneModel>> getPhoneList() async {
    await Future.delayed(Duration(seconds: 3));
    return _phoneList;
  }

  Future<List<PhoneModel>> getPhoneListByPage() async {
    await Future.delayed(Duration(seconds: 3));
    _phoneList.addAll([
      PhoneModel(512, "Samsung Galaxy S20", 2020),
      PhoneModel(256, "iPhone 12 Pro", 2020),
    ]);
    return _phoneList;
    // return [];
  }
}
