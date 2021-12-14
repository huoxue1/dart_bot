// ignore: todo
// TODO: Put public facing types in this file.

import 'dart:convert';

import 'package:dart_bot/dart_bot.dart';
import 'package:dart_bot/src/Event/event.dart';
import 'package:dart_bot/src/enginer.dart';
import 'package:dart_bot/src/utils/config.dart';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

String data1 =
    '{"anonymous":{"id":0,"name":"","flag":""},"font":0,"group_id":0,"message":null,"message_type":"","post_type":"meta_event","raw_message":"","self_id":1603214019,"sender":{"age":0,"area":"","card":"","level":"","nickname":"","role":"","sex":"","title":"","user_id":0},"sub_type":"","user_id":0,"time":1639392474,"notice_type":"","request_type":"","comment":"","flag":"","operator_id":0,"file":{"id":"","name":"","size":0,"busid":0,"url":""},"duration":0,"target_id":0,"honor_type":"","meta_event_type":"heartbeat","status":{"app_enabled":true,"app_good":true,"app_initialized":true,"good":true,"online":true,"plugins_good":null,"stat":{"packet_received":30,"packet_sent":21,"packet_lost":0,"message_received":1,"message_sent":0,"disconnect_times":0,"lost_times":0,"last_message_time":1639392346}},"interval":5000,"card_new":"","card_old":"","message_id":0} ';

void main(List<String> args) {
  var ws = WsServer(config: Config(address: "127.0.0.1", port: 8080));
  Enginer(ws).start();
}
