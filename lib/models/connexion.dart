class Authentification {
  int? id;
  String? username;
  String? password;
  
  List<Roles>? roles;
  Liste? liste;

 Authentification(
      {this.id,
      this.username,
      this.password,
     
      this.roles,
      this.liste});

  Authentification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];

    
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    liste = json['liste'] != null ? new Liste.fromJson(json['liste']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;

    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.liste != null) {
      data['liste'] = this.liste!.toJson();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Liste {
  int? idliste;
 

  Liste({this.idliste});

  Liste.fromJson(Map<String, dynamic> json) {
    idliste = json['idliste'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idliste'] = this.idliste;
   
    return data;
  }
}