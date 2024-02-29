import 'package:flutter/cupertino.dart';
import 'package:group8_mapd722/model/patient.dart';

class AddPatientProvider extends ChangeNotifier{
  int genderValue = 0;
  Patient patient = Patient();

  changeGender(bool selected, int index){
    genderValue = selected ? index : genderValue;
    notifyListeners();
  }
}