import 'dart:convert';
import 'package:http/http.dart' as http;

import '../services/globals.dart';

class AuthController {
  Future<http.Response> Connexion(String username, String password) async {
    Map data = {'username': username, 'password': password};

    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + '/auth/connexion');
    var response = await http.post(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      print(loginArr);
    } else {
      print(response.body);
    }
    return response;
  }
}
