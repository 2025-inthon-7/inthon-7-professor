import 'dart:developer';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web/web.dart' as web;

import 'package:inthon_7_professor/app/feature/classroom/logic/pip_state.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';

final pipProvider = NotifierProvider<PipProvider, PipState>(PipProvider.new);

class PipProvider extends Notifier<PipState> {
  @override
  build() {
    _setupChannel();
    return PipState(isInPipMode: false);
  }

  void _setupChannel() {
    // Set up message listener using js_interop
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
            // PIP에서 버튼 클릭 이벤트 수신
            final timestamp = DateTime.now().toString().substring(11, 19);
            final newEvent = 'Event from PIP at $timestamp';
            log('PIP button clicked: $newEvent');
          } else if (source == 'pip' && action == 'closed') {
            // PIP 창이 닫혔을 때
            state = state.copyWith(isInPipMode: false);
            setPipWindow = null;
          }
        }
      }.toJS,
    );
  }

  void sendEventsToPip() {
    if (!state.isInPipMode) return;
    final pip = pipWindow;
    if (pip != null && !pip.closed) {
      final message = {
        'action': 'updateEvents',
        'event':
            'New event at ${DateTime.now().toLocal().toString().substring(11, 19)}',
        'type': 'question', // 'question', 'difficult', 'easy' 중 하나
      }.jsify();

      pip.postMessage(message, '*');
    }
  }

  Future<void> startPIPMode() async {
    try {
      // Check if documentPictureInPicture is available
      if (documentPictureInPicture == null) {
        RouterService.I.showToast('PIP가 지원되지 않습니다. Chrome/Edge 116+를 사용하세요.');
        return;
      }

      final options = {'width': 200, 'height': 300}.jsify();

      final pipWindowPromise = documentPictureInPicture!
          .callMethod<JSPromise<PIPWindow>>('requestWindow'.toJS, options);
      final pipWin = await pipWindowPromise.toDart;

      // Store reference to PIP window
      setPipWindow = pipWin;

      // Add styles
      final style = pipWin.document.createElement('style');
      style.textContent = '''
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
    padding: 4px 0;
    font-size: 13px;
    color: hsl(0 0% 20%);
    line-height: 1.5;
    position: relative;
  }
  
  .event-icon {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    margin-top: 5px;
    flex-shrink: 0;
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
''';
      pipWin.document.head!.appendChild(style);

      // Add HTML content
      pipWin.document.body!.innerHTML =
          '''
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
      '''
              .toJS;

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
      final pipMessageHandler = ((web.Event event) {
        final messageEvent = event as web.MessageEvent;
        final data = messageEvent.data;

        if (data != null) {
          print("Received message in PIP window");
          final jsData = data as JSObject;
          final action = jsData.getProperty<JSString?>('action'.toJS)?.toDart;

          if (action == 'updateEvents') {
            final eventList = pipWin.document.getElementById('event-list');
            final eventText = jsData
                .getProperty<JSString?>('event'.toJS)
                ?.toDart;
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

              print('Event added: $eventText (type: $eventType)');
            }
          }
        }
      }.toJS);

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

      // Send initial events
      sendEventsToPip();
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

// Helper extension for JSObject manipulation
extension JSObjectExtension on Map<String, dynamic> {
  JSObject jsify() {
    final jsObject = JSObject();
    forEach((key, value) {
      if (value is String) {
        jsObject.setProperty(key.toJS, value.toJS);
      } else if (value is num) {
        jsObject.setProperty(key.toJS, value.toJS);
      } else if (value is bool) {
        jsObject.setProperty(key.toJS, value.toJS);
      } else if (value is List<String>) {
        final jsArray = value.map((e) => e.toJS).toList().toJS;
        jsObject.setProperty(key.toJS, jsArray);
      } else if (value is Map<String, dynamic>) {
        jsObject.setProperty(key.toJS, value.jsify());
      }
    });
    return jsObject;
  }
}

// JS Interop extensions
extension type PIPWindow(JSObject _) implements JSObject {
  external web.Document get document;
  external void postMessage(JSAny? message, String targetOrigin);
  external bool get closed;
  external void close();
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
