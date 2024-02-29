import 'package:flutter/cupertino.dart';
import 'package:group8_mapd722/model/patient.dart';

class PatientProvider extends ChangeNotifier{
  List<Patient> patients = [];

  setPatientList(List<Patient> list){
    patients = list;
    notifyListeners();
  }

}