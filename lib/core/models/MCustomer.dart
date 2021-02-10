class MCustomer {
  int iD;
  String iDPEL;
  String fullName;
  String poleNumber;
  String substationID;
  String powerRatingID;
  String kWHNumber;
  String kWHBrand;
  String kWHYear;
  String latitude;
  String longitude;
  bool verified;

  MCustomer(
      {this.iD,
      this.iDPEL,
      this.fullName,
      this.poleNumber,
      this.substationID,
      this.powerRatingID,
      this.kWHNumber,
      this.kWHBrand,
      this.kWHYear,
      this.latitude,
      this.longitude,
      this.verified});

  MCustomer.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iDPEL = json['IDPEL'];
    fullName = json['FullName'];
    poleNumber = json['PoleNumber'];
    substationID = json['SubstationID'];
    powerRatingID = json['PowerRatingID'];
    kWHNumber = json['KWHNumber'];
    kWHBrand = json['KWHBrand'];
    kWHYear = json['KWHYear'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    verified = json['Verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IDPEL'] = this.iDPEL;
    data['FullName'] = this.fullName;
    data['PoleNumber'] = this.poleNumber;
    data['SubstationID'] = this.substationID;
    data['PowerRatingID'] = this.powerRatingID;
    data['KWHNumber'] = this.kWHNumber;
    data['KWHBrand'] = this.kWHBrand;
    data['KWHYear'] = this.kWHYear;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Verified'] = this.verified;
    return data;
  }
}
