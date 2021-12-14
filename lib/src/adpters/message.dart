class MessageSegment {
  Map<String, dynamic> data = {};
  String type = "";

  MessageSegment({required this.data, required this.type});

  MessageSegment.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['type'] = type;
    return data;
  }
}

class Message {
  List<MessageSegment> segments = [];

  Message(List<dynamic> mess) {
    for (var i = 0; i < mess.length; i++) {
      segments.add(MessageSegment(data: mess[i], type: mess[i]['type']));
    }
  }

  @override
  String toString() {
    return segments.map((segment) => segment.toString()).join();
  }
}
