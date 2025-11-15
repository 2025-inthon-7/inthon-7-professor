import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_state.dart';

final eventProvider = NotifierProvider<EventProvider, EventState>(
  EventProvider.new,
);

class EventProvider extends Notifier<EventState> {
  @override
  build() {
    return EventState(events: []);
  }
}
