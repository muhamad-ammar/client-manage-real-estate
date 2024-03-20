class UsersResponse {
  String? status;
  List<Users>? users;

  UsersResponse({this.status, this.users});

  UsersResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? name;
  String? id;
  String? mobile1;
  String? mobile2;
  String? email;
  String? role;
  List<String>? assignees;

  Users(
      {this.name,
        this.id,
        this.mobile1,
        this.mobile2,
        this.email,
        this.role,
        this.assignees});

  Users.fromJson(Map<String, dynamic> json) {
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
