import 'dart:convert';
import 'dart:developer';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/extension/js_interlop_x.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_type.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/js_helper.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:intl/intl.dart';
import 'package:web/helpers.dart';
import 'package:web/web.dart' as web;

import 'package:inthon_7_professor/app/feature/classroom/logic/pip_state.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';

final pipProvider = NotifierProvider<PipProvider, PipState>(PipProvider.new);

// PIP 윈도우 스타일
const String _pipWindowStyles = '''
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    background: hsl(0 0% 100%);
    height: 100vh;
    display: flex;
    flex-direction: column;
  }

  h2 {
    color: hsl(0 0% 3.9%);
    margin-bottom: 12px;
    font-size: 18px;
    font-weight: 600;
    padding: 16px 16px 0 16px;
  }

  #event-list {
    flex: 1;
    background: hsl(0 0% 100%);
    padding: 8px 12px;
    overflow-y: auto;
    
  }

  .text-ellipsis {
    display: -webkit-box;
    -webkit-line-clamp: 2;  /* 표시할 줄 수 */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  #event-list::-webkit-scrollbar {
    width: 6px;
  }

  #event-list::-webkit-scrollbar-track {
    background: transparent;
  }

  #event-list::-webkit-scrollbar-thumb {
    background: hsl(0 0% 85%);
    border-radius: 3px;
  }

  #event-list::-webkit-scrollbar-thumb:hover {
    background: hsl(0 0% 70%);
  }

  .event-item {
    display: flex;
    align-items: flex-start;
    gap: 8px;
    padding: 8px;
    font-size: 13px;
    color: hsl(0 0% 20%);
    line-height: 1.2;
    position: relative;
    border-radius: 6px;
    transition: all 0.2s;
  }

  .event-item.clickable {
    cursor: pointer;
    background: hsl(210 40% 98%);
    border: 1px solid hsl(210 40% 90%);
  }

  .event-item.clickable:hover {
    background: hsl(210 40% 96%);
    border-color: hsl(210 40% 80%);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transform: translateY(-1px);
  }

  .event-item.clickable .event-text::after {
    content: '🔍';
    margin-left: 6px;
    font-size: 12px;
    opacity: 0.6;
  }

  .event-icon {
    width: 16px;
    height: 16px;
    border-radius: 50%;
    margin-top: 3px;
    flex-shrink: 0;
    color: #FFFFFF;
    text-align: center;
    font-size: 13px;
  }

  .event-icon.question {
    background: #3B82F6;
  }

  .event-icon.difficult {
    background: #EF4444;
  }

  .event-icon.easy {
    background: #10B981;
  }

  .event-icon.info {
    background: #6366F1;
  }

  .event-text {
    flex: 1;
    word-break: break-word;
  }

  .new-badge {
    display: inline-block;
    background: #4285F4;
    color: #FFFFFF;
    font-size: 10px;
    font-weight: 600;
    padding: 2px 6px;
    border-radius: 4px;
    margin-left: 8px;
    vertical-align: middle;
  }

  .empty-state {
    text-align: center;
    color: hsl(0 0% 45.1%);
    padding: 40px 20px;
    font-size: 14px;
  }

  .button-container {
    display: flex;
    gap: 0px;
    padding: 0;
    border-top: 1px solid hsl(0 0% 89.8%);
    background: hsl(0 0% 100%);
  }

  #alert-btn {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 10px 16px;
    font-size: 14px;
    font-weight: 500;
    background: hsl(0 0% 9%);
    color: hsl(0 0% 98%);
    border: none;
    cursor: pointer;
    transition: background 0.2s;
  }

  #alert-btn:hover {
    background: hsl(0 0% 9% / 0.9);
  }

  #alert-btn:active {
    transform: scale(0.98);
  }

  #close-btn {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    background: hsl(0 0% 100%);
    color: hsl(0 0% 3.9%);
    border: 1px solid hsl(0 0% 89.8%);
    cursor: pointer;
    transition: all 0.2s;
  }

  #close-btn:hover {
    background: hsl(0 0% 96.1%);
  }

  #close-btn:active {
    transform: scale(0.95);
  }

  .icon {
    width: 16px;
    height: 16px;
  }

  .event-count {
    display: inline-block;
    background: hsl(220 70% 50%);
    color: white;
    font-size: 11px;
    font-weight: 600;
    padding: 2px 6px;
    border-radius: 10px;
    margin-left: 6px;
    min-width: 18px;
    text-align: center;
  }
''';

// PIP 윈도우 HTML 콘텐츠
const String _pipWindowHtml = '''
  <div style="display: flex; flex-direction: column; height: 100%;">
    <div id="event-list">
      <div class="empty-state">아직 이벤트가 없습니다</div>
    </div>
    <div class="button-container">
      <button id="alert-btn">
        <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path>
        </svg>
        <span>중요 알림 보내기</span>
      </button>
      <button id="close-btn">
        <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
        </svg>
      </button>
    </div>
  </div>
''';

class PipProvider extends Notifier<PipState> {
  @override
  build() {
    _setupChannel();
    return PipState(isInPipMode: false);
  }

  void _setupChannel() {
    web.window.addEventListener(
      'message',
      (web.Event event) {
        final messageEvent = event as web.MessageEvent;
        final data = messageEvent.data;

        if (data != null && data.isA<JSObject>()) {
          final jsData = data as JSObject;
          final source = jsData.getProperty<JSString?>('source'.toJS)?.toDart;
          final action = jsData.getProperty<JSString?>('action'.toJS)?.toDart;

          if (source == 'pip' && action == 'buttonClicked') {
            ref.read(homeProvider.notifier).sendImportantNotification();
          } else if (source == 'pip' && action == 'closed') {
            state = state.copyWith(isInPipMode: false);
            setPipWindow = null;
          }
        }
      }.toJS,
    );
  }

  void updateEvents(List<EventType> events) {
    if (!state.isInPipMode) return;
    final pip = pipWindow;
    if (pip != null && !pip.closed) {
      Map message = <String, dynamic>{
        'action': 'updateEvents',
        'eventsCount': events.length,
      };
      for (int i = 0; i < events.length; i++) {
        message['events$i'] = {
          'type': events[i].type.name,
          'event': events[i].content,
          'imageUrl': events[i].imageData.isNotEmpty
              ? 'data:image/png;base64,${base64Encode(events[i].imageData)}'
              : '',
          'count': events[i].count,
          'timestamp': DateFormat('HH:mm:ss').format(events[i].timestamp),
        }.jsify();
      }

      pip.postMessage(message.jsify() as JSObject, '*');
    }
  }

  Future<void> startPIPMode(List<EventType> events) async {
    log('Starting PIP mode with ${events.length} events');
    try {
      // Check if documentPictureInPicture is available
      if (documentPictureInPicture == null) {
        RouterService.I.showToast('PIP가 지원되지 않습니다. Chrome/Edge 116+를 사용하세요.');
        return;
      }

      final options = {'width': 220, 'height': 330}.jsify();
      final pipWin = await documentPictureInPicture!
          .callMethod<JSPromise<PIPWindow>>('requestWindow'.toJS, options)
          .toDart;

      setPipWindow = pipWin;

      final style = pipWin.document.createElement('style');
      style.textContent = _pipWindowStyles;
      pipWin.document.head!.appendChild(style);

      pipWin.document.body!.innerHTML = _pipWindowHtml.toJS;

      // Set up alert button click handler
      final alertBtn =
          pipWin.document.getElementById('alert-btn') as web.HTMLButtonElement;
      alertBtn.onclick = ((web.MouseEvent event) {
        final message = {'source': 'pip', 'action': 'buttonClicked'}.jsify();
        web.window.postMessage(message, '*'.toJS);
      }.toJS);

      // Set up close button click handler
      final closeBtn =
          pipWin.document.getElementById('close-btn') as web.HTMLButtonElement;
      closeBtn.onclick = ((web.MouseEvent event) {
        final message = {'source': 'pip', 'action': 'closed'}.jsify();
        web.window.postMessage(message, '*'.toJS);
        (pipWin as JSObject).callMethod('close'.toJS);
      }.toJS);

      // Set up message listener in PIP window
      final pipMessageHandler = getpipMessageHandler(pipWin);

      // Add message listener to PIP window
      (pipWin as JSObject).callMethod(
        'addEventListener'.toJS,
        'message'.toJS,
        pipMessageHandler,
      );

      // Set up pagehide event listener
      final pagehideHandler = ((web.Event event) {
        final message = {'source': 'pip', 'action': 'closed'}.jsify();
        web.window.postMessage(message, '*'.toJS);
        setPipWindow = null;
      }.toJS);

      (pipWin as JSObject).callMethod(
        'addEventListener'.toJS,
        'pagehide'.toJS,
        pagehideHandler,
      );

      state = state.copyWith(isInPipMode: true);
      updateEvents(events);
    } catch (e) {
      log('Error opening PIP: $e');
      RouterService.I.showToast('PIP를 열 수 없습니다: $e');
    }
  }

  void closePIPMode() {
    final pip = pipWindow;
    if (pip != null && !pip.closed) {
      pip.close();
    }
    setPipWindow = null;
    state = state.copyWith(isInPipMode: false);
  }
}

@JS('documentPictureInPicture')
external JSObject? get documentPictureInPicture;

extension DocumentPIPExtension on JSObject {
  external JSPromise<PIPWindow> requestWindow(JSObject options);
}

@JS('window.pipWindow')
external PIPWindow? pipWindow;

@JS('window.pipWindow')
external set setPipWindow(PIPWindow? value);
