class RegisterRequest {
  String? login;
  String? firstName;
  String? fullName;
  String? lastName;
  String? email;
  String? mobile1;
  String? mobile2;
  String? password;
  String? description;
  String? role;

  RegisterRequest({
    this.login,
    this.firstName,
    this.fullName,
    this.lastName,
    this.email,
    this.mobile1,
    this.mobile2,
    this.password,
    this.description,
    this.role,
  });

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    firstName = json['first_name'];
    fullName = json['full_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    password = json['password'];
    description = json['description'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['login'] = login;
    data['first_name'] = firstName;
    data['full_name'] = fullName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile1'] = mobile1;
    data['mobile2'] = mobile2;
    data['password'] = password;
    data['description'] = description;
    data['role'] = role ?? "";
    return data;
  }
}
