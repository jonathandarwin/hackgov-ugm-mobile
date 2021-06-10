import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HomeProvider extends ChangeNotifier {

  List<String> userList = [];
  String message = "";
  bool loading = true;

  void requestUserData() {
    // Call API Async
    loading = true;
    Future<Response> response = get(Uri.parse('https://reqres.in/api/users'));
    response.then((value) {
        loading = false;
        userList.clear();

        if(value.statusCode == 200) {
          // Success
          Map<String, dynamic> rawData = jsonDecode(value.body);
          List<dynamic> listData = rawData["data"] as List;

          if(listData.isEmpty) message = "No Data.";

          listData.forEach((element) {
            userList.add("${element["first_name"]} ${element["last_name"]}");
          });
        }
        else {
          message = "Error. Please try again.";
        }

        notifyListeners();

    }).catchError((error) {
      loading = false;

      print('ERROR LOADING DATA FROM API');
      print(error);

      message = "Error. Please try again.";
      userList.clear();
      notifyListeners();
    });
  }
}