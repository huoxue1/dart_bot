import 'dart:convert';
import 'dart:math';
import 'package:dart_bot/src/utils/utils.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:dog/dog.dart';

class Log {
  static Dog logger = Dog(
      handler:
          Handler(formatter: SimpleFormatter(), emitter: ConsoleEmitter()));
  Log() {
    logger.d("Logger initialized");
  }
  static void d(message) {
    logger.d(message);
  }

  static void e(message) {
    logger.e(message);
  }

  static void i(message) {
    logger.i(message);
  }

  static void w(message) {
    logger.w(message);
  }

  static void v(message) {
    logger.v(message);
  }
}

/// This formatter will not generate borders.
class SimpleFormatter extends Formatter {
  /// The level we will retrieve from StackTrace.
  final int stackTraceLevel;

  /// Function to get caller info.
  final MessageCallback? callerGetter;

  SimpleFormatter(
      {this.stackTraceLevel = 10,
      this.callerGetter = SimpleFormatter.defaultCaller});

  static Object? defaultCaller() {
    List<Frame> frames = Trace.current().frames;
    if (frames.isNotEmpty) {
      for (int i = frames.length - 1; i >= 0; i--) {
        if (frames[i].package == 'dog') {
          return frames[min<int>(i + 1, frames.length - 1)].toString();
        }
      }
    }
    return null;
  }

  @override
  List<String> format(record) {
    List<String> lines = [];
    // tag/level time caller
    String? caller = callerGetter?.call().toString();
    lines.add('[${Utils.formatDate(record.dateTime)}]'
        ' [${record.tag ?? record.level.name}] '
        '${record.title == null ? '' : (record.title)}'
        ' ${convertMessage(record.message)}');
    if (record.tag == 'debug') {
      lines.add(caller ?? '');
    }
    // title
    // if (record.title != null) {
    //   lines.add(record.title!);
    // }
    // // message
    // String msg = convertMessage(record.message);
    // lines.add(msg);
    // stack trace
    if (record.stackTrace != null) {
      String st = convertStackTrace(record.stackTrace!);
      lines.add(st);
    }
    return lines;
  }

  String convertMessage(dynamic message) {
    String msg;
    if (message is String) {
      msg = message;
    } else if (message is Map || message is Iterable) {
      try {
        msg = jsonEncode(message);
      } catch (e) {
        // JsonUnsupportedObjectError
        msg = message.toString();
      }
    } else if (message is MessageCallback) {
      msg = message().toString();
    } else if (message is Exception) {
      msg = message.toString();
    } else if (message is StackTrace) {
      msg = convertStackTrace(message);
    } else {
      msg = message.toString();
    }
    return msg;
  }

  /// [stackTraceLevel] lines at most.
  String convertStackTrace(StackTrace stackTrace) {
    String st = stackTrace.toString();
    List<String> lines = st.split('\n');
    int length = lines.length;
    st = length <= stackTraceLevel
        ? st
        : lines.sublist(0, min(length, stackTraceLevel)).join('\n');
    if (st.endsWith('\n')) {
      st = st.substring(0, st.length - 2); // rm the last empty line.
    }
    return st;
  }
}
