class Clients {
  String? status;
  List<Client>? clients;

  Clients({this.status, this.clients});

  Clients.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['clients'] != null) {
      clients = <Client>[];
      json['clients'].forEach((v) {
        clients!.add(new Client.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.clients != null) {
      data['clients'] = this.clients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Client {
  String? name;
  String? id;
  String? mobile1;
  String? mobile2;
  String? email;
  String? status;
  String? assignedTo;

  Client(
      {this.name,
        this.id,
        this.mobile1,
        this.mobile2,
        this.email,
        this.status,
        this.assignedTo});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    email = json['email'];
    status = json['status'];
    assignedTo = json['assigned to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['email'] = this.email;
    data['status'] = this.status;
    data['assigned to'] = this.assignedTo;
    return data;
  }
}
