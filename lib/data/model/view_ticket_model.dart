class ViewTicketModel {
  ViewTicketData? data;
  bool? success;
  int? status;

  ViewTicketModel({this.data, this.success, this.status});

  ViewTicketModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ViewTicketData.fromJson(json['data']) : null;
    success = json['success'];
    status = json['status'];
  }
}

class ViewTicketData {
  int? id;
  String? code;
  String? user;
  int? userId;
  String? subject;
  String? priority;
  String? files;
  int? status;
  int? viewed;
  int? clientViewed;
  String? createdAt;
  Message? message;

  ViewTicketData(
      {this.id,
      this.code,
      this.user,
      this.userId,
      this.subject,
      this.priority,
      this.files,
      this.status,
      this.viewed,
      this.clientViewed,
      this.createdAt,
      this.message});

  ViewTicketData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    user = json['user'];
    userId = json['user_id'];
    subject = json['subject'];
    priority = json['priority'];
    files = json['files'];
    status = json['status'];
    viewed = json['viewed'];
    clientViewed = json['client_viewed'];
    createdAt = json['created_at'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }
}

class Message {
  List<MessageData>? data;

  Message({this.data});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MessageData>[];
      json['data'].forEach((v) {
        data!.add(MessageData.fromJson(v));
      });
    }
  }
}

class MessageData {
  int? id;
  int? userId;
  String? reply;
  String? user;
  String? files;
  String? createdAt;

  MessageData(
      {this.id,
      this.userId,
      this.reply,
      this.files,
      this.createdAt,
      this.user});

  MessageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    user = json['user'];
    reply = json['reply'];
    files = json['files'];
    createdAt = json['created_at'];
  }
}
