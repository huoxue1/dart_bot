import '../adpters/base_bot.dart';

abstract class BaseDriver {
  run();
  Map<String, BaseBot> getBots();
  BaseBot? getBot({required String id});
  void setHandler(Function(dynamic) handler);
}
