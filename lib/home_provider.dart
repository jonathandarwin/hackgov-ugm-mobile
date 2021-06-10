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
    /**
     * Future is like Promises in JavaScript.
     * It is used to handle async process, where the result is not
     * received after the calling function. 
     * 
     * The result will be passed in then((value)) callback.
     */

    Future<Response> response = get(Uri.parse('https://reqres.in/api/users'));
    response.then((value) {
        loading = false;
        userList.clear();

        if(value.statusCode == 200) {
          // Success

          /**
           * because the body is a string, we should convert it to
           * Map<String, dynamic> that represent the json structure.
           * 
           * From the Map, we can access the values by giving a right 
           * key.
           */
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
      /**
       * this line of code only executed when there is something wrong
       * or even crash in the Future process.
       */
      
      loading = false;

      print('ERROR LOADING DATA FROM API');
      print(error);

      message = "Error. Please try again.";
      userList.clear();
      notifyListeners();
    });
  }
}