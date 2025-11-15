import 'dart:developer';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:inthon_7_professor/app/extension/js_interlop_x.dart';
import 'package:web/web.dart' as web;

void _showEventPopup(PIPWindow pipWin, String content, String imageUrl) {
  // Escape single quotes in content
  final escapedContent = content.replaceAll("'", "\\'");

  // Create HTML content for new window
  final htmlContent = '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Event Details</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      background: hsl(0 0% 98%);
      padding: 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }
    .container {
      background: white;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      max-width: 800px;
      width: 100%;
      overflow: hidden;
    }
    .header {
      background: hsl(0 0% 9%);
      color: white;
      padding: 16px 20px;
      font-size: 18px;
      font-weight: 600;
    }
    .content {
      padding: 24px;
    }
    .image-container {
      width: 100%;
      margin-bottom: 20px;
    }
    .image-container img {
      width: 100%;
      height: auto;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    .text-content {
      font-size: 16px;
      line-height: 1.6;
      color: hsl(0 0% 20%);
      padding: 16px;
      background: hsl(0 0% 96%);
      border-radius: 8px;
      border-left: 4px solid hsl(220 70% 50%);
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">Event Details</div>
    <div class="content">
      <div class="image-container">
        <img src="$imageUrl" alt="Event Image" />
      </div>
      <div class="text-content">
        $escapedContent
      </div>
    </div>
  </div>
</body>
</html>
''';

  // Open new window with specified size
  (pipWin as JSObject).callMethod(
    'open'.toJS,
    'about:blank'.toJS,
    '_blank'.toJS,
    'width=800,height=600,resizable=yes,scrollbars=yes'.toJS,
  );

  // Get the newly opened window
  final newWindow = (pipWin as JSObject).getProperty<JSObject>('_newWin'.toJS);

  // Write HTML content to new window using a different approach
  (pipWin as JSObject).callMethod(
    'setTimeout'.toJS,
    (() {
      final openedWindows = (pipWin as JSObject).callMethod<JSObject>(
        'open'.toJS,
        'about:blank'.toJS,
        '_blank'.toJS,
        'width=800,height=600,resizable=yes,scrollbars=yes'.toJS,
      );

      if (openedWindows != null) {
        final doc = openedWindows.getProperty<JSObject>('document'.toJS);
        if (doc != null) {
          doc.callMethod('write'.toJS, htmlContent.toJS);
          doc.callMethod('close'.toJS);
        }
      }
    }.toJS),
    0.toJS,
  );
}

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
        final imageUrl = jsData.getProperty<JSString?>('imageUrl'.toJS)?.toDart;

        if (eventList != null && eventText != null) {
          // empty-state가 있으면 제거
          final emptyState = eventList.querySelector('.empty-state');
          if (emptyState != null) {
            emptyState.remove();
          }

          final currentTime = DateTime.now().millisecondsSinceEpoch;

          // 1분 안에 나온 difficult, easy event 병합 체크
          if (eventType == 'EType.difficult' || eventType == 'EType.easy') {
            final existingItems = eventList.querySelectorAll('.event-item');
            for (var i = 0; i < existingItems.length; i++) {
              final node = existingItems.item(i);
              if (node == null) continue;

              final item = node as web.Element;
              final itemType = item.getAttribute('data-type');
              final itemTimestamp = item.getAttribute('data-timestamp');

              if (itemType == eventType && itemTimestamp != null) {
                final timestamp = int.tryParse(itemTimestamp);
                if (timestamp != null &&
                    (currentTime - timestamp) < 60000) {
                  // 1분 이내
                  // 기존 이벤트의 카운트 증가
                  final countBadge = item.querySelector('.event-count');
                  if (countBadge != null) {
                    final currentCount =
                        int.tryParse(countBadge.textContent ?? '1') ?? 1;
                    countBadge.textContent = (currentCount + 1).toString();
                  } else {
                    // 카운트 배지가 없으면 생성
                    final textContainer = item.querySelector('.event-text');
                    if (textContainer != null) {
                      final newCountBadge = pipWin.document.createElement('span');
                      newCountBadge.className = 'event-count';
                      newCountBadge.textContent = '2';
                      textContainer.appendChild(newCountBadge);
                    }
                  }

                  // 병합되었으므로 새 이벤트는 추가하지 않음
                  log('Event merged: $eventText (type: $eventType)');
                  return;
                }
              }
            }
          }

          // 새 이벤트 컨테이너 생성
          final eventItem = pipWin.document.createElement('div');
          eventItem.className = 'event-item';
          eventItem.setAttribute(
            'data-timestamp',
            currentTime.toString(),
          );
          eventItem.setAttribute('data-type', eventType);

          // imageUrl이 있으면 저장하고 클릭 가능하게 표시
          if (imageUrl != null && imageUrl.isNotEmpty) {
            eventItem.className = 'event-item clickable';
            eventItem.setAttribute('data-image-url', imageUrl);
            eventItem.setAttribute('data-content', eventText);

            // 클릭 이벤트 추가
            eventItem.addEventListener(
              'click',
              ((web.Event event) {
                _showEventPopup(pipWin, eventText, imageUrl);
              }.toJS),
            );
          }

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
