import 'package:dart_bot/src/handler.dart';
import 'package:dart_bot/src/rule/rule.dart';

class Mather {
  String type = "on";
  List<Handler> handlers = [];
  List<Rule> rules = [];
  bool block = false;
  int weight = 0;
  Map<String, dynamic> data = {};

  Mather(
      this.type, this.rules, this.handlers, this.block, this.weight, this.data);

  Mather.on(
      {List<Rule> rules = const [],
      List<Handler> handlers = const [],
      bool block = false,
      int weight = 0,
      Map<String, dynamic> data = const {}})
      : this("on", rules, handlers, block, weight, data);

  Mather.onMessage(
      {List<Rule> rules = const [],
      List<Handler> handlers = const [],
      bool block = false,
      int weight = 0,
      Map<String, dynamic> data = const {}})
      : this("onMessage", rules, handlers, block, weight, data);

  Mather.onCommand(
      {List<Rule> rules = const [],
      List<Handler> handlers = const [],
      bool block = false,
      int weight = 0,
      Map<String, dynamic> data = const {}})
      : this("on_command", rules, handlers, block, weight, data);

  void handle(Handler handler) {
    handlers.add(handler);
  }

  Mather addRule(Rule rule) {
    rules.add(rule);
    return this;
  }
}
