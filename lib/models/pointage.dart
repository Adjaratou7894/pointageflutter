import 'dart:ffi';

class EnregistrementPointage {
  Long? idpointage;
  String? date;
  String? heurefin;
  Null? images;
  Null? object;
  int? latitude;
  int? longitude;

  EnregistrementPointage(
      {this.idpointage,
      this.date,
      this.heurefin,
      this.images,
      this.object,
      this.latitude,
      this.longitude});

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
