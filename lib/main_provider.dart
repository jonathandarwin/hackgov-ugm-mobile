import 'package:flutter/foundation.dart';

class MainProvider extends ChangeNotifier {

  String username = "";
  String password = "";
  bool isButtonDisabled = true;

  
  void determineButtonState() {
    bool temp = username == '' || password == '';
    if(temp != isButtonDisabled) {
      isButtonDisabled = temp;
      notifyListeners();
    }
  }
}