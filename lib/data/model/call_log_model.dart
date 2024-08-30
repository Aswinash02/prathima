import 'package:call_log/call_log.dart';

class CallLogData {
  String? name;
  String? number;
  String? formattedNumber;
  String? callType;
  String? duration;
  String? timestamp;
  String? cachedNumberType;
  String? cachedNumberLabel;
  String? simDisplayName;
  String? phoneAccountId;

  CallLogData(
      {this.name,
      this.number,
      this.formattedNumber,
      this.callType,
      this.duration,
      this.timestamp,
      this.cachedNumberType,
      this.cachedNumberLabel,
      this.simDisplayName,
      this.phoneAccountId});

  CallLogData.fromJson(CallLogEntry json) {
    name = json.name;
    number = json.number;
    formattedNumber = json.formattedNumber;
    callType = json.callType.toString();
    duration = json.duration.toString();
    timestamp = json.timestamp.toString();
    cachedNumberType = json.cachedNumberType.toString();
    cachedNumberLabel = json.cachedNumberLabel;
    simDisplayName = json.simDisplayName;
    phoneAccountId = json.phoneAccountId;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['number'] = number;
    data['formatted_number'] = formattedNumber;
    data['call_type'] = callType;
    data['duration'] = duration;
    data['timestamp'] = timestamp;
    data['cached_number_type'] = cachedNumberType;
    data['cached_number_label'] = cachedNumberLabel;
    data['sim_display_name'] = simDisplayName;
    data['phone_account_id'] = phoneAccountId;
    return data;
  }
}
