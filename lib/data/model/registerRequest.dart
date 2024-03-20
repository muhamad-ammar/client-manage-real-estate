class RegisterRequest {
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? gender;

  RegisterRequest({
    this.login,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
  });

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    gender = json['user_gender'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['login'] = login;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['gender'] = gender ?? "";
    return data;
  }
}
