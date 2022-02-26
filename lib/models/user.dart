class Users {
  String firstName;
  String lastName;
  String email;
  String password;
  String uid;

  Users(
      {this.firstName, this.lastName, this.email, this.password, this.uid});

  Users.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['uid'] = this.uid;
    return data;
  }
}