import 'dart:convert';

const String baseURL = "http://10.0.2.2:8080/api";
const Map<String, String> headers = {"Content-type": "application/json"};

int status = 0;

int usId = 0;
int? pointageId;
String? nomapprenant;
String? prenomapprenant;
// String? arrive ;
// String? depart;
DateTime date = DateTime.now()
    .toLocal(); // convertit la chaîne de caractères en un objet DateTime

int heure = date.hour; // extrait l'heure de l'objet DateTime
int minute = date.minute; // extrait les minutes
DateTime heurefin = DateTime.now().toLocal();

int heured = heurefin.hour; // extrait l'heure de l'objet DateTime
int minuted = heurefin.minute; // extrait les minutes
      
      
