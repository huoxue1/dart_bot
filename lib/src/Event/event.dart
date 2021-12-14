import 'package:dart_bot/src/adpters/message.dart';

class Event {
  Anonymous? anonymous;
  int? font;
  int? groupId;
  Message? message;
  String? messageType;
  String? postType;
  String? rawMessage;
  int? selfId;
  Sender? sender;
  String? subType;
  int? userId;
  int? time;
  String? noticeType;
  String? requestType;
  String? comment;
  String? flag;
  int? operatorId;
  File? file;
  int? duration;
  int? targetId;
  String? honorType;
  String? metaEventType;
  Status? status;
  int? interval;
  String? cardNew;
  String? cardOld;
  int? messageId;

  Event(
      {this.anonymous,
      this.font,
      this.groupId,
      this.message,
      this.messageType,
      this.postType,
      this.rawMessage,
      this.selfId,
      this.sender,
      this.subType,
      this.userId,
      this.time,
      this.noticeType,
      this.requestType,
      this.comment,
      this.flag,
      this.operatorId,
      this.file,
      this.duration,
      this.targetId,
      this.honorType,
      this.metaEventType,
      this.status,
      this.interval,
      this.cardNew,
      this.cardOld,
      this.messageId});

  @override
  String toString() {
    return 'Event{anonymous: $anonymous, font: $font, groupId: $groupId, message: $message, messageType: $messageType, postType: $postType, rawMessage: $rawMessage, selfId: $selfId, sender: $sender, subType: $subType, userId: $userId, time: $time, noticeType: $noticeType, requestType: $requestType, comment: $comment, flag: $flag, operatorId: $operatorId, file: $file, duration: $duration, targetId: $targetId, honorType: $honorType, metaEventType: $metaEventType, status: $status, interval: $interval, cardNew: $cardNew, cardOld: $cardOld, messageId: $messageId}';
  }

  Event.fromJson(Map<String, dynamic> json) {
    anonymous = (json['anonymous'] != null
        ? Anonymous.fromJson(json['anonymous'])
        : null);
    font = json.containsKey("font") ? json['font'] : null;
    groupId = json.containsKey("group_id") ? json['group_id'] : null;

    message = json.containsKey("message") ? Message(json["message"]) : null;

    messageType =
        json.containsKey("message_type") ? json['message_type'] : null;
    postType = json.containsKey("post_type") ? json['post_type'] : null;
    rawMessage = json.containsKey("raw_message") ? json['raw_message'] : null;
    selfId = json.containsKey("self_id") ? json['self_id'] : null;
    sender = (json['sender'] != null ? Sender.fromJson(json['sender']) : null);
    subType = json.containsKey("sub_type") ? json['sub_type'] : null;
    userId = json.containsKey("user_id") ? json['user_id'] : null;
    time = json.containsKey("time") ? json['time'] : null;
    noticeType = json.containsKey("notice_type") ? json['notice_type'] : null;
    requestType =
        json.containsKey("request_type") ? json['request_type'] : null;
    comment = json.containsKey("comment") ? json['comment'] : null;
    flag = json.containsKey("flag") ? json['flag'] : null;
    operatorId = json.containsKey("operator_id") ? json['operatorI_id'] : null;
    file = (json['file'] != null ? File.fromJson(json['file']) : null);
    duration = json.containsKey("duration") ? json['duration'] : null;
    targetId = json.containsKey("targetId") ? json['targetId'] : null;
    honorType = json.containsKey("honor_type") ? json['honor_type'] : null;
    metaEventType =
        json.containsKey("meta_event_type") ? json['meta_event_type'] : null;
    status = (json['status'] != null ? Status.fromJson(json['status']) : null);
    interval = json.containsKey("interval") ? json['interval'] : null;
    cardNew = json.containsKey("card_new") ? json['card_new'] : null;
    cardOld = json.containsKey("card_old") ? json['card_old'] : null;
    messageId = json.containsKey("message_id") ? json['message_d'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (anonymous != null) {
      data['anonymous'] = anonymous!.toJson();
    }
    data['font'] = font;
    data['group_id'] = groupId;
    data['message'] = message;
    data['message_type'] = messageType;
    data['post_type'] = postType;
    data['raw_message'] = rawMessage;
    data['self_id'] = selfId;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    data['sub_type'] = subType;
    data['user_id'] = userId;
    data['time'] = time;
    data['notice_type'] = noticeType;
    data['request_type'] = requestType;
    data['comment'] = comment;
    data['flag'] = flag;
    data['operator_id'] = operatorId;
    if (file != null) {
      data['file'] = file!.toJson();
    }
    data['duration'] = duration;
    data['target_id'] = targetId;
    data['honor_type'] = honorType;
    data['meta_event_type'] = metaEventType;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['interval'] = interval;
    data['card_new'] = cardNew;
    data['card_old'] = cardOld;
    data['message_id'] = messageId;
    return data;
  }
}

class Anonymous {
  int? id;
  String? name;
  String? flag;

  Anonymous({this.id, this.name, this.flag});

  Anonymous.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['flag'] = flag;
    return data;
  }
}

class Sender {
  int? age;
  String? area;
  String? card;
  String? level;
  String? nickname;
  String? role;
  String? sex;
  String? title;
  int? userId;

  Sender(
      {this.age,
      this.area,
      this.card,
      this.level,
      this.nickname,
      this.role,
      this.sex,
      this.title,
      this.userId});

  Sender.fromJson(Map<String, dynamic> json) {
    age = json.containsKey("age") ? json["age"] : null;
    area = json.containsKey("area") ? json["area"] : null;
    card = json.containsKey("card") ? json["card"] : null;
    level = json.containsKey("level") ? json["level"] : null;
    nickname = json.containsKey("nickname") ? json["nickname"] : null;
    role = json.containsKey("role") ? json["role"] : null;
    sex = json.containsKey("sex") ? json["sex"] : nickname;
    title = json.containsKey("title") ? json["title"] : null;
    userId = json.containsKey("user_id") ? json["user_id"] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['area'] = area;
    data['card'] = card;
    data['level'] = level;
    data['nickname'] = nickname;
    data['role'] = role;
    data['sex'] = sex;
    data['title'] = title;
    data['user_id'] = userId;
    return data;
  }
}

class File {
  String? id;
  String? name;
  int? size;
  int? busid;
  String? url;

  File({this.id, this.name, this.size, this.busid, this.url});

  File.fromJson(Map<String, dynamic> json) {
    id = json.containsKey("id") ? json["id"] : null;
    name = json.containsKey("name") ? json["name"] : null;
    size = json.containsKey("size") ? json["size"] : null;
    busid = json.containsKey("busid") ? json["busid"] : null;
    url = json.containsKey("url") ? json["url"] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['size'] = size;
    data['busid'] = busid;
    data['url'] = url;
    return data;
  }
}

class Status {
  bool? appEnabled;
  bool? appGood;
  bool? appInitialized;
  bool? good;
  bool? online;
  Stat? stat;

  Status(
      {this.appEnabled,
      this.appGood,
      this.appInitialized,
      this.good,
      this.online,
      this.stat});

  Status.fromJson(Map<String, dynamic> json) {
    appEnabled = json.containsKey("app_enabled") ? json["app_enabled"] : null;
    appGood = json.containsKey("app_good") ? json["app_good"] : null;
    appInitialized =
        json.containsKey("app_initialized") ? json["app_initialized"] : null;
    good = json.containsKey("good") ? json["good"] : null;
    online = json.containsKey("online") ? json["online"] : null;
    stat = json.containsKey("stat") ? Stat.fromJson(json["stat"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_enabled'] = appEnabled;
    data['app_good'] = appGood;
    data['app_initialized'] = appInitialized;
    data['good'] = good;
    data['online'] = online;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class Stat {
  int? packetReceived;
  int? packetSent;
  int? packetLost;
  int? messageReceived;
  int? messageSent;
  int? disconnectTimes;
  int? lostTimes;
  int? lastMessageTime;

  Stat(
      {this.packetReceived,
      this.packetSent,
      this.packetLost,
      this.messageReceived,
      this.messageSent,
      this.disconnectTimes,
      this.lostTimes,
      this.lastMessageTime});

  Stat.fromJson(Map<String, dynamic> json) {
    packetReceived =
        json.containsKey("packet_received") ? json["packet_received"] : null;
    packetSent = json.containsKey("packet_sent") ? json["packet_sent"] : null;
    packetLost = json.containsKey("packet_lost") ? json["packet_lost"] : null;
    messageReceived =
        json.containsKey("message_received") ? json["message_received"] : null;
    messageSent =
        json.containsKey("message_sent") ? json["message_sent"] : null;
    disconnectTimes =
        json.containsKey("disconnect_times") ? json["disconnect_times"] : null;
    lostTimes = json.containsKey("lost_times") ? json["lost_times"] : null;
    lastMessageTime = json.containsKey("last_message_time")
        ? json["last_message_time"]
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['packet_received'] = packetReceived;
    data['packet_sent'] = packetSent;
    data['packet_lost'] = packetLost;
    data['message_received'] = messageReceived;
    data['message_sent'] = messageSent;
    data['disconnect_times'] = disconnectTimes;
    data['lost_times'] = lostTimes;
    data['last_message_time'] = lastMessageTime;
    return data;
  }
}
