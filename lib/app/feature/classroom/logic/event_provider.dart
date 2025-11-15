import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_state.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_type.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/pip_provider.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:inthon_7_professor/app/service/screen_capture_service.dart';
import 'package:web_socket/web_socket.dart';

final eventProvider = NotifierProvider<EventProvider, EventState>(
  EventProvider.new,
);

class EventProvider extends Notifier<EventState> {
  @override
  build() {
    return EventState(events: []);
  }

  void listenSocket(WebSocket? socket) {
    socket?.events.listen((e) async {
      try {
        if (e is TextDataReceived) {
          final text = e.text;
          log('Received text: $text');
          _handleSocket(jsonDecode(text));
        } else if (e is BinaryDataReceived) {
          log('Received Binary: ${e.data}');
        } else if (e is CloseReceived) {
          log('Connection to server closed: ${e.code} [${e.reason}]');
        }
      } catch (error, stackTrace) {
        log('Error handling websocket event: $error');
        log('Stack trace: $stackTrace');
      }
    });
  }

  void startClass(EventType event) {
    state = state.copyWith(events: [event]);
  }

  void _handleSocket(Map<String, dynamic> data) async {
    debugPrint('Handling socket data: $data');
    final type = data['event'];

    final image = (await ScreenCaptureService.I.captureFrame())?.toList() ?? [];

    switch (type) {
      case "feedback":
        var event = () {
          if (data["feedback_type"] == "HARD") {
            return EventType(
              type: EType.difficult,
              content: "익명의 학생이 어려워하고있어요.",
              timestamp: DateTime.parse(
                data["created_at"],
              ).add(const Duration(hours: 9)),
            );
          } else {
            return EventType(
              type: EType.easy,
              content: "학생들이 잘 이해하고 있어요.",
              timestamp: DateTime.parse(
                data["created_at"],
              ).add(const Duration(hours: 9)),
            );
          }
        }();
        event = event.copyWith(imageData: image);
        _updateEvent(event);
        break;
      case "question_intent":
        ref
            .read(homeProvider.notifier)
            .sendQuestionImage(id: data["question_id"]);
        break;
      case "new_question":
        final event = EventType(
          type: EType.question,
          content: data["cleaned_text"],
          timestamp: DateTime.parse(
            data["created_at"],
          ).add(const Duration(hours: 9)),
          imageData: image,
        );
        _updateEvent(event);

        break;
    }
  }

  void _updateEvent(EventType newEvent) {
    final recentEvent = state.events.lastWhereOrNull(
      (e) =>
          e.type == newEvent.type &&
          newEvent.type != EType.question &&
          newEvent.timestamp.difference(e.timestamp).inMinutes < 1,
    );

    if (recentEvent == null) {
      state = state.copyWith(events: [...state.events, newEvent]);
    } else {
      final updatedEvents = state.events.map((e) {
        if (e == recentEvent) {
          if (recentEvent.count + 1 == 2 &&
              recentEvent.type == EType.difficult) {
            ref.read(homeProvider.notifier).sendHardFeedback();
          }
          return recentEvent.copyWith(count: recentEvent.count + 1);
        }
        return e;
      }).toList();

      state = state.copyWith(events: updatedEvents);
    }

    ref.read(pipProvider.notifier).updateEvents(state.events);
  }
}

extension on List<EventType> {
  EventType? lastWhereOrNull(
    bool Function(EventType) test, {
    EventType? Function()? orElse,
  }) {
    for (var i = length - 1; i >= 0; i--) {
      if (test(this[i])) {
        return this[i];
      }
    }
    return orElse != null ? orElse() : null;
  }
}
