import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HomeProvider extends ChangeNotifier {

  List<String> userList = [];
  String message = "";
  bool loading = true;

  void requestUserData() async {
    /**
     * async keyword meant that this function will do some
     * asynchronous operation.
     */
    // Call API Async
    
    /**
     * Future is like Promises in JavaScript.
     * It is used to handle async process, where the result is not
     * received after the calling function. 
     * 
     * The result will be passed in then((value)) callback.
     */

    try {
      loading = true;

      /**
       * await keyword means that it will wait until it gets the data
       * and continue the execution process
       */
      Response response = await get(Uri.parse('https://reqres.in/api/users'));
      loading = false;
      userList.clear();

      if(response.statusCode == 200) {
        // Success

        /**
         * because the body is a string, we should convert it to
         * Map<String, dynamic> that represent the json structure.
         * 
         * From the Map, we can access the values by giving a right 
         * key.
         */
        Map<String, dynamic> rawData = jsonDecode(response.body);
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
    }
    catch(e) {
      /**
       * this line of code only executed when there is something wrong
       * or even crash in the Future process.
       */
      
      loading = false;

      print('ERROR LOADING DATA FROM API');
      print(e);

      message = "Error. Please try again.";
      userList.clear();
      notifyListeners();
    }
  }
}