class MUser {
  int iD;
  String username;
  String password;
  int access;

  MUser({this.iD, this.username, this.password, this.access});

  MUser.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    username = json['Username'];
    password = json['Password'];
    access = json['Access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Username'] = this.username;
    data['Password'] = this.password;
    data['Access'] = this.access;
    return data;
  }
}
