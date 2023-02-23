class DemandePermission {
  int? idpermission;
  String? dateSoumission;
  // String? dateDebut;
  // String? dateFin;
  // String duree;
  String motif;
  String descriptionMotif;
  // String statut;

  DemandePermission(this.idpermission, this.dateSoumission, this.motif,
      this.descriptionMotif);

  factory DemandePermission.fromMap(Map json) {
    return DemandePermission(
      json['idpermission'],
      json['dateSoumission'],
      // json['dateDebut'],
      // json['dateFin'],
      // json['duree'],
      json['motif'],
      json['descriptionMotif'],
      // json['statut'],
    );
  }
  // DemandePermission .fromJson(Map<String, dynamic> json) {
  //   idpermission = json['idpermission'];
  //   dateSoumission = json['dateSoumission'];
  //   dateDebut = json['dateDebut'];
  //   dateFin = json['dateFin'];
  //   duree = json['duree'];
  //   motif = json['motif'];
  //  descriptionMotif= json['descriptionMotif'];
  //   statut = json['statut'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idpermission'] = this.idpermission;
    data['dateSoumission'] = this.dateSoumission;
    // data['dateDebut'] = this.dateDebut;
    // data['dateFin'] = this.dateFin;
    // data['duree'] = this.duree;
    data['motif'] = this.motif;
    data['descriptionMotif'] = this.descriptionMotif;
    // data['statut'] = this.statut;
    return data;
  }
}
