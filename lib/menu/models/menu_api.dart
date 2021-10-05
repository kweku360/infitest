import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infitest/menu/models/menu.dart';

const String apiUrl =
    "https://service1-dot-infishare-client-test.uc.r.appspot.com/menu/public?merchant_id=1I0MPVUqtHxxAsnxdWWt&merchant_group_id=9hEyRjsiwXh3afRpeAnn9A2VuTH2";
/* Class consumes date from api and pupulates menu class. */
class MenuApi {
  MenuApi();
  //api call is performed here
  Future<Menu> getMenu() async {
    try {
      final apiResponse =
          await http.get(Uri.parse(apiUrl)).timeout(Duration(seconds: 60));

      if (apiResponse.statusCode == 200) {
        //json transcoding
        var jsonObj = json.decode(apiResponse.body);

        Menu menu = Menu.fromJson(jsonObj);
        return menu;
      } else {
        return Menu.withError("Unable to fetch menu, please try again");
      }
    } catch (e) {
      print(e.toString());
      return Menu.withError("Error : ${e.toString()}");
    }
  }
}
