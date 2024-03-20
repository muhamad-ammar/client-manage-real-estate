class FollowUpResponse {
  String? status;
  String? clientWithNoFollowUps;
  List<FollowUps>? followUps;

  FollowUpResponse({this.status, this.clientWithNoFollowUps, this.followUps});

  FollowUpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    clientWithNoFollowUps = json['clientWithNoFollowUps'];
    if (json['followUps'] != null) {
      followUps = <FollowUps>[];
      json['followUps'].forEach((v) {
        followUps!.add(new FollowUps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['clientWithNoFollowUps'] = this.clientWithNoFollowUps;
    if (this.followUps != null) {
      data['followUps'] = this.followUps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FollowUps {
  String? clientName;
  String? clientId;
  String? teamMemberName;
  String? teamMemberId;
  String? timeStamp;
  String? title;
  String? description;

  FollowUps(
      {this.clientName,
        this.clientId,
        this.teamMemberName,
        this.teamMemberId,
        this.timeStamp,
        this.title,
        this.description});

  FollowUps.fromJson(Map<String, dynamic> json) {
    clientName = json['clientName'];
    clientId = json['clientId'];
    teamMemberName = json['teamMemberName'];
    teamMemberId = json['teamMemberId'];
    timeStamp = json['timeStamp'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientName'] = this.clientName;
    data['clientId'] = this.clientId;
    data['teamMemberName'] = this.teamMemberName;
    data['teamMemberId'] = this.teamMemberId;
    data['timeStamp'] = this.timeStamp;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
