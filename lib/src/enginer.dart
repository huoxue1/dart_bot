import 'package:dart_bot/src/Event/event.dart';
import 'package:dart_bot/src/driver/base_driver.dart';
import 'package:dart_bot/src/utils/log.dart';

class Enginer {
  final BaseDriver _driver;
  Enginer(this._driver);

  void start() {
    _driver.setHandler(handler);
    _driver.run();
  }

  void handler(data) {
    Log.d(data);
    Event e = Event.fromJson(data);
    Log.d("$e.postType");
    switch (e.postType) {
      case "meta_event":
        {
          Log.d("收到了元事件");
          break;
        }
      case "message":
        {
          Log.d("收到了消息事件");
          if (e.userId == 3343780376) {
            var bot = _driver.getBot(id: e.selfId.toString());
            bot!.callApi("send_private_msg",
                params: {"user_id": e.userId, "message": "你好"});
          }
          break;
        }
      case "request":
        {
          Log.d("收到了请求事件");
          break;
        }
      case "notice":
        {
          Log.d("收到了通知事件");
          break;
        }
      default:
    }
  }
}
