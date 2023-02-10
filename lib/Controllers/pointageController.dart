import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pointageflutter/accueil.dart';

import '../services/globals.dart';

class AuthController {
  Future<http.Response> Connexion(String username, String password) async {
    Map data = {'username': username, 'password': password};
    // print(data);
    // var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + '/auth/connexion');
    var response = await http.post(url, body: body, headers: headers);

    try {
      if (response.statusCode == 200) {
        var loginArr = json.decode(response.body);

        print(loginArr);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }

    return response;
  }

}
