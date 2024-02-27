import 'package:flutter/cupertino.dart';

class GlobleProvider extends ChangeNotifier{

  static final GlobleProvider _instance = GlobleProvider._internal();

  static GlobleProvider get instance => _instance;

  GlobleProvider._internal() {
    //Todo
  }
}