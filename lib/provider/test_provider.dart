import 'package:flutter/material.dart';
import 'package:group8_mapd722/model/test.dart';

class TestProvider extends ChangeNotifier{
  List<Test> tests = [];

  setPatientTestList(List<Test> list){
    tests = list;
    notifyListeners();
  }

  removePatientTestAtIndex(int index){
    tests.removeAt(index);
    notifyListeners();
  }

  clearPatientTest(){
    tests.clear();
    notifyListeners();
  }
}