import 'package:flutter/cupertino.dart';
import 'package:group8_mapd722/model/patient.dart';

class PatientProvider extends ChangeNotifier{
  List<Patient> patients = [];
  Patient? patient;

  setPatientList(List<Patient> list){
    patients = list;
    notifyListeners();
  }

  removePatientAtIndex(int index){
    patients.removeAt(index);
    notifyListeners();
  }

  clearPatient(){
    patients.clear();
    notifyListeners();
  }

  setPatient(Patient value){
    patient = value;
    notifyListeners();
  }

}