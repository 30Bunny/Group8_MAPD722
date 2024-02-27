import 'package:flutter/cupertino.dart';

class AddPatientProvider extends ChangeNotifier{
  int genderValue = 0;

  changeGender(bool selected, int index){
    genderValue = selected ? index : genderValue;
    notifyListeners();
  }
}