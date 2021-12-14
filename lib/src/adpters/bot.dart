import 'dart:io';
import 'dart:convert';

import 'package:dart_bot/src/adpters/base_bot.dart';
import 'package:dart_bot/src/utils/log.dart';
import 'package:uuid/uuid.dart';

class Bot extends BaseBot {
  late WebSocket _socket;
  late String _selfId;
  late Function(dynamic data) _f;

  Bot();

  Map<String, dynamic> response = {};

  @override
  Future<Map<String, dynamic>> callApi(String api,
      {required Map params}) async {
    String uuid = Uuid().v4();
    try {
      _socket.add({"action": api, "params": params, "echo": uuid});
    } catch (e) {
      Log.e(e);
      _socket.close(10001, "send the message error");
      return {};
    }

    var res = await getreqponse(uuid);
    if (res == null) {
      throw "the api response time out";
    }
    return res;
  }

  @override
  void setConfig({required WebSocket socket, required String selfId}) {
    _socket = socket;
    _selfId = selfId;
  }

  Future<Map<String, dynamic>?> getreqponse(String echo) async {
    int i = 0;
    while (i < 30) {
      if (response.containsKey(echo)) {
        Map<String, dynamic> data = response[echo];
        data.remove(echo);
        return data;
      }
    }
    return null;
  }

  @override
  String getselfId() {
    return _selfId;
  }

  @override
  handleResponse(String uuid, Map<String, dynamic> data) {
    response[uuid] = data["data"];
  }

  @override
  handleMsg(event) {
    Map<String, dynamic> data = jsonDecode(event);
    // 存在echo字段
    if (data.containsKey("echo")) {
      handleResponse(data["echo"], data);
    } else {
      _f(data);
    }
  }

  @override
  setHandler(Function(dynamic data) f) {
    _f = f;
  }
}
