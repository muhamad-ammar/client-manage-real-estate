
class User {
  String? name;
  String? id;
  String? mobile1;
  String? mobile2;
  String? email;
  String? role;
  List<String>? assignees;

  User(
      {this.name,
        this.id,
        this.mobile1,
        this.mobile2,
        this.email,
        this.role,
        this.assignees});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    email = json['email'];
    role = json['role'];
    assignees = json['assignees'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['email'] = this.email;
    data['role'] = this.role;
    data['assignees'] = this.assignees;
    return data;
  }
}
