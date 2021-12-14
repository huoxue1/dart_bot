import 'dart:async';

import 'dart:io';

import 'package:dart_bot/src/adpters/base_bot.dart';
import 'package:dart_bot/src/adpters/bot.dart';
import 'package:dart_bot/src/driver/base_driver.dart';
import 'package:dart_bot/src/utils/config.dart';
import 'package:dart_bot/src/utils/log.dart';

class WsServer extends BaseDriver {
  late Config config;
  late void Function(dynamic) handler;

  Map<String, BaseBot> bots = {};
  WsServer({required this.config});

  @override
  void run() {
    Log.i('WsServer is running in ${config.address}:${config.port}');
    runZoned(() async {
      var server = await HttpServer.bind(config.address, config.port);
      server.listen((HttpRequest req) async {
        if (req.uri.path == '/cqhttp/ws') {
          WebSocket socket = await WebSocketTransformer.upgrade(req);

          String? selfId = req.headers.value("X-Self-ID");
          if (selfId == null) return;
          Log.d("the bot $selfId is connected");
          Bot b = Bot();
          b.setConfig(socket: socket, selfId: selfId);
          b.setHandler(handler);
          bots[selfId] = b;
          socket.handleError((error) {
            print(error);
            exit(3);
          });

          socket.done.then((_) {
            Log.i("the bot $selfId is disconnected");
            bots.remove(selfId);
          });
          socket.listen(b.handleMsg);
        }
      }, onDone: () {
        print("连接成功");
      }, onError: (error) {
        print("连接出现错误" + error);
      }, cancelOnError: false);
    });
  }

  @override
  BaseBot? getBot({required String id}) {
    if (bots.containsKey(id)) {
      return bots[id];
    } else {
      return null;
    }
  }

  @override
  Map<String, BaseBot> getBots() {
    return bots;
  }

  @override
  void setHandler(Function(dynamic) handler) {
    this.handler = handler;
  }
}
