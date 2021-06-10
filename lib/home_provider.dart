import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HomeProvider extends ChangeNotifier {

  List<String> userList = [];

  void requestUserData() {
    // Call API Async
    Future<Response> response = get(Uri.parse('https://reqres.in/api/users'));
    response.then((value) {

        userList.clear();
        if(value.statusCode == 200) {
          // Success
          Map<String, dynamic> rawData = jsonDecode(value.body);

          List<dynamic> list = rawData["data"] as List;

          list.forEach((element) {
            userList.add("${element["first_name"]} ${element["last_name"]}");
          });
        }

        notifyListeners();
    }).catchError((error) {
      print('ERROR LOADING DATA FROM API');
      print(error);

      userList.clear();
      notifyListeners();
    });
  }
}