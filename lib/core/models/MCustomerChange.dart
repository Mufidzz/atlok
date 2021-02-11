import 'package:atlok/core/models/MCustomer.dart';

class MCustomerChange {
  int iD;
  int currentCustomerID;
  int newCustomerID;

  MCustomerChange({this.iD, this.currentCustomerID, this.newCustomerID});

  MCustomerChange.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    currentCustomerID = json['CurrentCustomerID'];
    newCustomerID = json['NewCustomerID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CurrentCustomerID'] = this.currentCustomerID;
    data['NewCustomerID'] = this.newCustomerID;
    return data;
  }
}

class MACustomerChange extends MCustomerChange {
  MCustomer currentCustomer;

  MACustomerChange({
    iD,
    currentCustomerID,
    newCustomerID,
    this.currentCustomer,
  }) : super(
          iD: iD,
          currentCustomerID: currentCustomerID,
          newCustomerID: newCustomerID,
        );

  MACustomerChange.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    currentCustomerID = json['CurrentCustomerID'];
    newCustomerID = json['NewCustomerID'];
    currentCustomer = json['CurrentCustomer'] != null
        ? new MCustomer.fromJson(json['CurrentCustomer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CurrentCustomerID'] = this.currentCustomerID;
    data['NewCustomerID'] = this.newCustomerID;
    if (this.currentCustomer != null) {
      data['CurrentCustomer'] = this.currentCustomer.toJson();
    }
    return data;
  }
}
