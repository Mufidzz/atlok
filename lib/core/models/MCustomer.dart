import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/models/MSubstation.dart';

class MCustomer {
  int iD;
  String iDPEL;
  String fullName;
  String address;
  String poleNumber;
  int substationID;
  int powerRatingID;
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
      this.address,
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
    address = json['Address'];
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
    data['Address'] = this.address;
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

class MACustomer extends MCustomer {
  MSubstation substation;
  MPowerRate powerRating;

  MACustomer(
      {iD,
      iDPEL,
      fullName,
      address,
      poleNumber,
      substationID,
      powerRatingID,
      kWHNumber,
      kWHBrand,
      kWHYear,
      latitude,
      longitude,
      verified,
      this.substation,
      this.powerRating})
      : super(
          iD: iD,
          iDPEL: iDPEL,
          fullName: fullName,
          address: address,
          poleNumber: poleNumber,
          substationID: substationID,
          powerRatingID: powerRatingID,
          kWHNumber: kWHNumber,
          kWHBrand: kWHBrand,
          kWHYear: kWHYear,
          latitude: latitude,
          longitude: longitude,
          verified: verified,
        );

  MACustomer.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iDPEL = json['IDPEL'];
    fullName = json['FullName'];
    address = json['Address'];
    poleNumber = json['PoleNumber'];
    substationID = json['SubstationID'];
    powerRatingID = json['PowerRatingID'];
    kWHNumber = json['KWHNumber'];
    kWHBrand = json['KWHBrand'];
    kWHYear = json['KWHYear'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    verified = json['Verified'];
    substation = json['Substation'] != null
        ? new MSubstation.fromJson(json['Substation'])
        : null;
    powerRating = json['PowerRating'] != null
        ? new MPowerRate.fromJson(json['PowerRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IDPEL'] = this.iDPEL;
    data['FullName'] = this.fullName;
    data['Address'] = this.address;
    data['PoleNumber'] = this.poleNumber;
    data['SubstationID'] = this.substationID;
    data['PowerRatingID'] = this.powerRatingID;
    data['KWHNumber'] = this.kWHNumber;
    data['KWHBrand'] = this.kWHBrand;
    data['KWHYear'] = this.kWHYear;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Verified'] = this.verified;
    if (this.substation != null) {
      data['Substation'] = this.substation.toJson();
    }
    if (this.powerRating != null) {
      data['PowerRating'] = this.powerRating.toJson();
    }
    return data;
  }
}
