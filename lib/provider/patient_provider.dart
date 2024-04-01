import 'package:flutter/cupertino.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/model/patient.dart';

class PatientProvider extends ChangeNotifier {
  List<Patient> patients = [];
  List<Patient> allPatients = [];
  List<Patient> searchPatients = [];
  Patient? patient;
  String categoryValue = kCategoryList[0];

  setPatientList(List<Patient> list) {
    patients = list;
    allPatients = list;
    searchPatients = list;
    notifyListeners();
  }

  removePatientAtIndex(int index) {
    patients.removeAt(index);
    notifyListeners();
  }

  clearPatient() {
    patients.clear();
    notifyListeners();
  }

  setPatient(Patient value) {
    patient = value;
    notifyListeners();
  }

  changeCategory(String? value) {
    categoryValue = value!;
    if (value.toLowerCase() == 'all') {
      patients = allPatients;
    } else {
      patients = allPatients
          .where(
              (patient) => patient.status?.toLowerCase() == value.toLowerCase())
          .toList();
    }
    searchPatients = patients;
    notifyListeners();
  }

  search(String? value) {
    if (value == null || value.isEmpty) {
      patients = allPatients;
    } else {
      patients = searchPatients
          .where((patient) =>
              (patient.firstName ?? '')
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              (patient.lastName ?? '')
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              ('${patient.firstName} ${patient.lastName}')
                  .toLowerCase()
                  .contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
