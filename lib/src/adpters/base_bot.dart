import 'dart:core';
import 'dart:async';

import 'dart:io';

abstract class BaseBot {
  void setConfig({required WebSocket socket, required String selfId});
  Future<Map<String, dynamic>> callApi(String api, {required Map params});
  String getselfId();

  handleResponse(String uuid, Map<String, dynamic> data);

  handleMsg(event);

  setHandler(Function(dynamic data) f);
}
