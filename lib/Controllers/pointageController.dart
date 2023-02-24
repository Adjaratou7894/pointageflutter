import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../models/pointage.dart';
import '../services/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PointageController {
  // static const String baseUrl = 'http://localhost:8080/api/pointage';

  Future<http.Response> sauvegarderPointage(int? id) async {
    // try {
    Map<String, dynamic> data = {'longetude': 0.0, 'latitude': 0.0};
    Map<String, String> headers = {"Content-Type": "application/json"};
    var body = jsonEncode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var url =
        Uri.parse('http://10.0.2.2:8080/api/pointage/sauvegarderpointage/$id');
    //final url = '$baseUrl/sauvegarderpointage/$idUtilisateur';
    print("merci");

    print("id = $id");
    print(url);
    print(body);

    var response = await http.post(url, body: body, headers: headers);
    print("ca marche");

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      Map<String, dynamic> responseMap = responseData as Map<String, dynamic>;
      // arrive = responseMap['date']; //Afficher l'heure d'arrivée

      String arrive = responseMap[
          'date']; // suppose que responseMap['date'] est une chaîne de caractères qui représente une date et une heure au format ISO 8601
      // DateTime date = DateTime.parse(arrive);
      DateTime date = DateTime.now()
          .toLocal(); // convertit la chaîne de caractères en un objet DateTime

      int heure = date.hour; // extrait l'heure de l'objet DateTime
      int minute = date.minute; // extrait les minutes
      String minuteString = minute.toString().padLeft(2,
          '0'); // formatte la valeur des minutes avec un zéro devant si nécessaire
      prefs.setInt("heure", heure);
      prefs.setString("minute", minuteString);
      print("--------------------test-----------------");
      print("Heure : $heure:$minuteString"); // affiche l'heure
      // print("--------------------test-----------------");
      // print(arrive);

      pointageId = responseMap[
          'idpointage']; // Affiche la valeur associée à la clé 'key1' dans la réponse JSON
      print("ca marche OK");
      print(response.body);
      // pointageId = response.body.get()
      // final enregistrementPointage =
      //     EnregistrementPointage.fromJson(responseData);
      // print("test");
      // debugPrint('Pointage enregistré avec succès : $enregistrementPointage');
    } else {
      debugPrint(
          'Erreur lors de l\'enregistrement du pointage. Code de statut : ${response.statusCode}');
      return response;
    }
    // } catch (error) {
    //   debugPrint('Erreur : $error');
    // }
    return null!;
  }

  Future<http.Response> sauvegarderPointageFin() async {
    // try {
    Map<String, dynamic> data = {'longetude': 0.0, 'latitude': 0.0};
    Map<String, String> headers = {"Content-Type": "application/json"};
     SharedPreferences prefs = await SharedPreferences.getInstance();
    var body = jsonEncode(data);

    var url = Uri.parse(
        'http://10.0.2.2:8080/api/pointage/sauvegarderpointagefin/$pointageId');
    //final url = '$baseUrl/sauvegarderpointage/$idUtilisateur';
    print("merci");

    // print("id = $idpointage")!;
    print(url);
    print(body);

    var response = await http.post(url, body: body, headers: headers);
    print("ca marche");

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      Map<String, dynamic> responseMap = responseData as Map<String, dynamic>;
      // print("ajout heuredefin");
      print(response.body);
      String depart = responseMap['heurefin'];
      DateTime heurefin = DateTime.now().toLocal();

      int heured = heurefin.hour; // extrait l'heure de l'objet DateTime
      int minuted = heurefin.minute; // extrait les minutes
      String minutedeString = minuted.toString().padLeft(2,
          '0'); // formatte la valeur des minutes avec un zéro devant si nécessaire
      prefs.setInt("heured", heured);
      prefs.setString("minuted", minutedeString);

      print("--------------------test-----------------");
      print("Heure : $heured:$minutedeString "); // affiche l'heure

      // final enregistrementPointage =
      //     EnregistrementPointage.fromJson(responseData);
      // print("test");
      // debugPrint('Pointage enregistré avec succès : $enregistrementPointage');
    } else {
      debugPrint(
          'Erreur lors de l\'enregistrement du pointage. Code de statut : ${response.statusCode}');
      return response;
    }
    // } catch (error) {
    //   debugPrint('Erreur : $error');
    // }
    return null!;
  }
}
