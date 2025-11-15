import 'dart:developer';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:inthon_7_professor/app/extension/js_interlop_x.dart';
import 'package:web/web.dart' as web;

JSExportedDartFunction getpipMessageHandler(PIPWindow pipWin) {
  return ((web.Event event) {
    final messageEvent = event as web.MessageEvent;
    final data = messageEvent.data;

    if (data != null) {
      log("Received message in PIP window");
      final jsData = data as JSObject;
      final action = jsData.getProperty<JSString?>('action'.toJS)?.toDart;

      if (action == 'updateEvents') {
        final eventList = pipWin.document.getElementById('event-list');
        final eventText = jsData.getProperty<JSString?>('event'.toJS)?.toDart;
        final eventType =
            jsData.getProperty<JSString?>('type'.toJS)?.toDart ??
            'question'; // 기본값은 질문

        if (eventList != null && eventText != null) {
          // empty-state가 있으면 제거
          final emptyState = eventList.querySelector('.empty-state');
          if (emptyState != null) {
            emptyState.remove();
          }

          // 새 이벤트 컨테이너 생성
          final eventItem = pipWin.document.createElement('div');
          eventItem.className = 'event-item';
          eventItem.setAttribute(
            'data-timestamp',
            DateTime.now().millisecondsSinceEpoch.toString(),
          );

          // 아이콘 생성
          final icon = pipWin.document.createElement('div');
          icon.className = 'event-icon $eventType';

          // 텍스트 컨테이너 생성
          final textContainer = pipWin.document.createElement('div');
          textContainer.className = 'event-text';

          // 텍스트와 NEW 배지 추가
          final textSpan = pipWin.document.createElement('span');
          textSpan.textContent = eventText;
          textContainer.appendChild(textSpan);

          // NEW 배지 추가
          final newBadge = pipWin.document.createElement('span');
          newBadge.className = 'new-badge';
          newBadge.textContent = 'NEW';
          textContainer.appendChild(newBadge);

          // 30초 후 NEW 배지 제거 - PIP window의 전역 객체를 통해 setTimeout 호출
          (pipWin as JSObject).callMethod(
            'setTimeout'.toJS,
            (() {
              newBadge.remove();
            }.toJS),
            30000.toJS,
          );

          // 아이템에 아이콘과 텍스트 추가
          eventItem.appendChild(icon);
          eventItem.appendChild(textContainer);

          // 리스트에 추가
          eventList.appendChild(eventItem);

          // 스크롤을 맨 아래로
          eventList.scrollTop = eventList.scrollHeight;

          log('Event added: $eventText (type: $eventType)');
        }
      }
    }
  }.toJS);
}
