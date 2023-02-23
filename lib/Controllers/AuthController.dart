import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../services/globals.dart';

class AuthController {
  Future<http.Response> Connexion(String username, String password) async {
    Map data = {'username': username, 'password': password};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(data);
    // var jsonResponse = null;
    Map<String, String> headers = {"Content-Type": "application/json"};

    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + '/auth/connexion');
    var response = await http.post(url, body: body, headers: headers);

    try {
      if (response.statusCode == 200) {
        var loginArr = json.decode(response.body);
        var name = jsonDecode(response.body);
        var lastname = jsonDecode(response.body);
        prefs.setInt("id", loginArr['id']);
        prefs.setString("nom", name['nom']);
        prefs.setString("prenom", lastname['prenom']);
        nomapprenant = name['nom'];
        prenomapprenant = lastname['prenom'];
        print(name['nom']);
        print(lastname['prenom']);

        //print(loginArr['id']);
        usId = loginArr['id'];
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }

    return response;
  }

//    print('Response Status: ${response.statusCode}');
//     print('Response Body: ${response.body}');

//     print('JSONREPONSE:${jsonResponse}');
//     if (response.statusCode  == 200) {
//     //  setState(() {
//         _isLoading = false;
//       });
//       /sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
//       sharedPreferences.setString("body", response.body);
//       isLoggedIn
//       sharedPreferences.setBool("isLoggedIn", true);/
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (BuildContext context) => Accueil()),
//               (Route<dynamic> route) => false);
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//      // sharedPreferences.setBool("isLoggedIn", false);
//       print(response.body);
//     }
//   }
// }

}
