class SupportTicketsModel {
  List<TicketData>? data;
  bool? success;
  int? status;

  SupportTicketsModel({this.data, this.success, this.status});

  SupportTicketsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TicketData>[];
      json['data'].forEach((v) {
        data!.add(TicketData.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }
}

class TicketData {
  int? id;
  String? code;
  int? userId;
  String? subject;
  String? priority;
  String? files;
  int? status;
  int? viewed;
  int? clientViewed;
  String? createdAt;

  TicketData(
      {this.id,
      this.code,
      this.userId,
      this.subject,
      this.priority,
      this.files,
      this.status,
      this.viewed,
      this.clientViewed,
      this.createdAt});

  TicketData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    userId = json['user_id'];
    subject = json['subject'];
    priority = json['priority'];
    files = json['files'];
    status = json['status'];
    viewed = json['viewed'];
    clientViewed = json['client_viewed'];
    createdAt = json['created_at'];
  }
}
