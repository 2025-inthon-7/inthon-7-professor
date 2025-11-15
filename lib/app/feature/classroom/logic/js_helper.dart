import 'dart:developer';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:math' hide log;

import 'package:inthon_7_professor/app/extension/js_interlop_x.dart';
import 'package:web/web.dart' as web;

void _showEventPopup(PIPWindow pipWin, String content, String imageUrl) {
  // Escape single quotes in content
  final escapedContent = content.replaceAll("'", "\\'");

  // Create HTML content for new window
  final htmlContent =
      '''
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
      padding: 12px;
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
      padding: 12px;
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

  // Get the newly opened window
  final newWindow =
      (pipWin as JSObject).callMethod(
            'open'.toJS,
            'about:blank'.toJS,
            '_blank'.toJS,
            'width=800,height=800,resizable=yes,scrollbars=yes'.toJS,
          )
          as JSObject?;

  if (newWindow != null) {
    final doc = newWindow.getProperty<JSObject>('document'.toJS);
    doc.callMethod('open'.toJS);
    doc.callMethod('write'.toJS, htmlContent.toJS);
    doc.callMethod('close'.toJS);
  }
}

JSExportedDartFunction getpipMessageHandler(PIPWindow pipWin) {
  return ((web.Event event) {
    final messageEvent = event as web.MessageEvent;
    final data = messageEvent.data;

    if (data != null) {
      log("Received message in PIP window");

      final jsData = data as JSObject;
      final action = jsData.getProperty<JSString?>('action'.toJS)?.toDart;
      final eventCount = jsData.getProperty<JSNumber?>('eventsCount'.toJS);

      if (action == 'updateEvents') {
        final eventList = pipWin.document.getElementById('event-list')!;
        eventList.innerHTML = ''.toJS;
        final currentTime = DateTime.now().millisecondsSinceEpoch;

        for (var i = 0; i < (eventCount?.toDartInt ?? 0); i++) {
          final eventObj = jsData.getProperty<JSObject>('events$i'.toJS);
          final eventText = eventObj
              .getProperty<JSString?>('event'.toJS)
              ?.toDart;
          final eventType =
              eventObj.getProperty<JSString?>('type'.toJS)?.toDart ??
              'question'; // 기본값은 질문
          final imageUrl = eventObj
              .getProperty<JSString?>('imageUrl'.toJS)
              ?.toDart;
          final count =
              eventObj.getProperty<JSNumber?>('count'.toJS)?.toDartInt ?? 1;

          final eventItem = pipWin.document.createElement('div');
          eventItem.className = 'event-item';
          eventItem.setAttribute('data-timestamp', currentTime.toString());
          eventItem.setAttribute('data-type', eventType);

          // image
          if (imageUrl != null && imageUrl.isNotEmpty) {
            eventItem.className = 'event-item clickable';
            eventItem.setAttribute('data-image-url', imageUrl);
            eventItem.setAttribute('data-content', eventText!);

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
          icon.textContent = count > 0 ? count.toString() : '';

          // 텍스트 컨테이너 생성
          final textContainer = pipWin.document.createElement('div');
          textContainer.className = 'event-text text-ellipsis';

          // 텍스트와 NEW 배지 추가
          final textSpan = pipWin.document.createElement('span');
          textSpan.textContent = eventText;
          textContainer.appendChild(textSpan);

          // 아이템에 아이콘과 텍스트 추가
          eventItem.appendChild(icon);
          eventItem.appendChild(textContainer);
          eventList.appendChild(eventItem);
        }

        eventList.scrollTop = eventList.scrollHeight;
      }
    }
  }.toJS);
}
