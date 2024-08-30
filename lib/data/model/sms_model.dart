import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class SmsData {
  String? id;
  String? threadId;
  String? address;
  String? body;
  String? read;
  String? date;
  String? dateSent;
  String? kind;
  String? state;

  SmsData(
      {this.id,
      this.threadId,
      this.address,
      this.body,
      this.read,
      this.date,
      this.dateSent,
      this.kind,
      this.state});

  SmsData.fromJson(SmsMessage json) {
    id = json.id.toString();
    threadId = json.threadId.toString();
    address = json.address;
    body = json.body;
    read = json.read.toString();
    date = json.date.toString();
    dateSent = json.dateSent.toString();
    kind = json.kind.toString();
    state = json.state.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thread_id'] = threadId;
    data['address'] = address;
    data['body'] = body;
    data['read'] = read;
    data['date'] = date;
    data['date_sent'] = dateSent;
    data['kind'] = kind;
    data['state'] = state;
    return data;
  }
}
