class MFare {
  int iD;
  String code;
  String name;

  MFare({this.iD, this.code, this.name});

  MFare.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    code = json['Code'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Code'] = this.code;
    data['Name'] = this.name;
    return data;
  }
}
