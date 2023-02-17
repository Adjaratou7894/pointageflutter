import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:pointageflutter/models/demande.dart';
import '../models/pointage.dart';
import '../services/globals.dart';

class DemandeController {
  // static const String baseUrl = 'http://localhost:8080/api/pointage';
  // pour ajouter une demande de permission

  Future<http.Response> permission(
      int? id, String motif, String descriptionMotif) async {
    // try {
    Map data = {'motif': motif, 'descriptionMotif': descriptionMotif};
    Map<String, String> headers = {"Content-Type": "application/json"};
    var body = jsonEncode(data);

    var url = Uri.parse('http://10.0.2.2:8080/api/permission/creer/$id');
    //final url = '$baseUrl/sauvegarderpointage/$idUtilisateur';
    print("merci");

    print("id = $id");
    print(url);
    print(body);

    var response = await http.post(url, body: body, headers: headers);
    print("ca marche");

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      //   Map<String, dynamic> responseMap = responseData as Map<String, dynamic>;
      //  pointageId =  responseMap['idpointage']; // Affiche la valeur associée à la clé 'key1' dans la réponse JSON
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

//  Afficher la liste des demandes
  static Future<List<DemandePermission>> listedemande(int? id) async {
    var url = Uri.parse('http://10.0.2.2:8080/api/permission/liste/$id');
    http.Response response = await http.get(url, headers: headers);
    List responseList = jsonDecode(response.body);
    List<DemandePermission> demandePermissions = [];
    for (Map demandeMap in responseList) {
      DemandePermission demandePermission =
          DemandePermission.fromMap(demandeMap);
      demandePermissions.add(demandePermission);
    }
    return demandePermissions;
  }
}
