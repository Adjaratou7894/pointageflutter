import 'dart:ffi';

import 'package:flutter/foundation.dart';

class EnregistrementPointage {
  // // Long? idpointage;
  // // String? heurefin;
  // // Null? images;
  // // Null? object;
  // double latitude;
  // double longitude;

  // EnregistrementPointage(this.latitude, this.longitude);

  // factory EnregistrementPointage.fromMap(Map pointMap) {
  //   return EnregistrementPointage(pointMap['latitude'], pointMap['longitude']);
  // }

  // // Map<String, dynamic> toJson() {
  // //   final Map<String, dynamic> data = new Map<String, dynamic>();

  // //   data['idpointage'] = this.idpointage;
  // //   data['date'] = this.date;
  // //   data['heurefin'] = this.heurefin;
  // //   data['images'] = this.images;
  // //   data['object'] = this.object;
  // //   data['latitude'] = this.latitude;
  // //   data['longitude'] = this.longitude;
  // //   return data;
  // // }

  int? idpointage;
  String? date;
  Null? heurefin;
  Null? images;
  Null? object;
  int? latitude;
  int? longitude;

  EnregistrementPointage(this.idpointage, this.date, this.heurefin, this.images,
      this.object, this.latitude, this.longitude);

  EnregistrementPointage.fromJson(Map<String, dynamic> json) {
    idpointage = json['idpointage'];
    date = json['date'];
    heurefin = json['heurefin'];
    images = json['images'];
    object = json['object'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idpointage'] = this.idpointage;
    data['date'] = this.date;
    data['heurefin'] = this.heurefin;
    data['images'] = this.images;
    data['object'] = this.object;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
