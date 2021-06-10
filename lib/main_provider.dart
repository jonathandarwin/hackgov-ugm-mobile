import 'package:flutter/foundation.dart';

/*
 * choose ChangeNotifier from foundation.dart
 * it contains notifyListeners() method that will be used inside.
 */
class MainProvider extends ChangeNotifier {

  /*
   * Provider usually contains the states and variables
   * which affect the change of the state
   */
  String username = "";
  String password = "";
  bool isButtonDisabled = true;

  /*
   * This function will be triggered every time user give an input
   * to either UsernameTextField or PasswordTextField
   */
  void determineButtonState() {
    bool temp = username == '' || password == '';
    if(temp != isButtonDisabled) {
      isButtonDisabled = temp;

      /*
       * notifyListeners() makes all the Consumer widget re-render itself
       * and its descendants
       */
      notifyListeners();
    }
  }
}